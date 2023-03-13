import 'dart:async';
import 'dart:developer';

import 'package:ipotato/constants/enums.dart';
import 'package:ipotato/data/local/models/task_model.dart';
import 'package:ipotato/data/repos/task_repository.dart';
import 'package:ipotato/di/injector.dart';
import 'package:ipotato/stores/task_store.dart';
import 'package:ipotato/utils/utils.dart';
import 'package:mobx/mobx.dart';

part 'task_list_store.g.dart';

class TaskListStore = _TaskListStore with _$TaskListStore;

abstract class _TaskListStore with Store {
  final TaskRepository taskRepo = locator<TaskRepository>();

  @observable
  ObservableList<TaskStore> taskList = ObservableList<TaskStore>();

  @observable
  VisibilityFilter filter = VisibilityFilter.all;

  @computed
  ObservableList<TaskStore> get pendingTasks =>
      ObservableList.of(taskList.where((task) => task.isCompleted != true));

  @computed
  ObservableList<TaskStore> get completedTasks =>
      ObservableList.of(taskList.where((task) => task.isCompleted == true));

  @computed
  bool get hasCompletedTasks => completedTasks.isNotEmpty;

  @computed
  bool get hasPendingTasks => pendingTasks.isNotEmpty;

  @computed
  ObservableList<int?> get tasksIds {
    if (taskList.isEmpty) {
      return ObservableList.of(List.empty());
    }

    var idList = ObservableList.of(taskList.map((task) => task.id));
    return idList;
  }

  @computed
  ObservableList<TaskStore> get visibleTasks {
    switch (filter) {
      case VisibilityFilter.pending:
        return pendingTasks;
      case VisibilityFilter.completed:
        return completedTasks;
      case VisibilityFilter.all:
        return ObservableList.of([...completedTasks, ...pendingTasks]);
      default:
        return taskList;
    }
  }

  @action
  Future addTask(TaskModel taskModel) async {
    final taskId = await taskRepo.insertTask(task: taskModel);

    final task = TaskStore(
        id: taskId,
        title: taskModel.title!,
        description: taskModel.description!,
        lastKnownDuration: taskModel.lastKnownDuration!,
        timerValue: taskModel.timerValue!,
        isCompleted: taskModel.isCompleted!,
        isPaused: taskModel.isPaused!,
        isResumed: taskModel.isResumed!,
        isStarted: taskModel.isStarted!,
        duration: Utils.getDurationFromString(
            durationString: taskModel.lastKnownDuration!),
        countDownTimer: Timer(
            Utils.getDurationFromString(
                durationString: taskModel.lastKnownDuration!),
            () {}));

    taskList.add(task);

    if (taskModel.isStarted!) {
      task.start();
    }
  }

  @action
  void removeTask(TaskStore taskStore) {
    taskList.removeWhere((element) => element == taskStore);
    taskRepo.deleteTask(
        task: TaskModel(
      description: taskStore.description,
      id: taskStore.id,
      isCompleted: taskStore.isCompleted,
      isPaused: taskStore.isPaused,
      isResumed: taskStore.isResumed,
      isStarted: taskStore.isStarted,
      lastKnownDuration: taskStore.lastKnownDuration,
      timerValue: taskStore.timerValue,
      title: taskStore.title,
    ));
  }

  @action
  void changeFilter(VisibilityFilter filter) => this.filter = filter;

  @action
  void removeCompleted() {
    taskList.removeWhere((element) => element.isCompleted);
  }

  Future<void> reinstateStateFromDrift() async {
    final savedTasks = await taskRepo.getAllTasks();

    if (savedTasks.isNotEmpty) {
      for (TaskModel task in savedTasks) {
        if (!taskList.map((element) => element.id).contains(task.id)) {
          log('at store $task');
          final taskItem = TaskStore(
              id: task.id!,
              title: task.title!,
              description: task.description!,
              lastKnownDuration: task.lastKnownDuration!,
              timerValue: task.timerValue!,
              isCompleted: task.isCompleted!,
              isPaused: task.isPaused!,
              isResumed: task.isResumed!,
              isStarted: task.isStarted!,
              duration: Utils.getDurationFromString(
                  durationString: task.lastKnownDuration!),
              countDownTimer: Timer(
                  Utils.getDurationFromString(
                      durationString: task.lastKnownDuration!),
                  () {}));

          taskList.add(taskItem);
        }
      }
    }
  }
}
