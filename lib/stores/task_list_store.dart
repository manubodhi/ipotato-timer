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

///Store for managing the Task list, there is a separate store for Single tasks
///we are accessing each store via TaskList store so TaskStore not added in
///provider list
abstract class _TaskListStore with Store {
  ///Creating instance of task repository for accessing local db operations
  ///created inside store file to keep the logic separate from UI
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
    ///inserting to local db when adding a task inside the list
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
          () {}),
    );

    ///Adding task to the tasklist
    taskList.add(task);

    ///If task is getting added through the add dialog box it will automatically
    ///start the timer, if it is added from local db, user need to start it by
    ///clicking play button
    if (taskModel.isStarted!) {
      task.start();
    }
  }

  @action
  void removeTask(TaskStore taskStore) {
    ///Removing task will stop the timer
    taskStore.stop();

    ///Removing task from current state task list
    taskList.removeWhere((element) => element.id == taskStore.id);

    ///Removing task from local db
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
    ///Removing from task from task list
    taskList.removeWhere((element) => element.isCompleted);
  }

  Future<void> reinstateStateFromDrift() async {
    /// getting all tasks from local Db
    final savedTasks = await taskRepo.getAllTasks();

    /// Checking for empty list
    if (savedTasks.isNotEmpty) {
      ///Looping over saved list to adding it to the current task list
      for (TaskModel task in savedTasks) {
        ///Checking for dulpicate entries, don't miss the "!" at the beginning.
        if (!taskList.map((element) => element.id).contains(task.id)) {
          ///Creating a TaskStore instance manually
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
                () {}),
          );

          ///Adding the task to the list
          taskList.add(taskItem);
        }
      }
    }
  }
}
