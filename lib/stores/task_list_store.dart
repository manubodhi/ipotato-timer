import 'package:ipotato/constants/enums.dart';
import 'package:ipotato/data/local/models/task_model.dart';
import 'package:ipotato/stores/task_store.dart';
import 'package:ipotato/utils/utils.dart';
import 'package:mobx/mobx.dart';

part 'task_list_store.g.dart';

class TaskListStore = _TaskListStore with _$TaskListStore;

abstract class _TaskListStore with Store {
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
  String get tasksTitles {
    if (taskList.isEmpty) {
      return "There are no tasks here. Please use the below button to create one.";
    }

    final suffix = pendingTasks.length == 1 ? "task" : "tasks";
    return '${pendingTasks.length} pending $suffix, ${completedTasks.length} completed';
  }

  @computed
  ObservableList<TaskStore> get visibleTasks {
    switch (filter) {
      case VisibilityFilter.pending:
        return pendingTasks;
      case VisibilityFilter.completed:
        return completedTasks;
      default:
        return taskList;
    }
  }

  @computed
  bool get canRemoveAllCompleted =>
      hasCompletedTasks && filter != VisibilityFilter.pending;

  @computed
  bool get canMarkAllCompleted =>
      hasPendingTasks && filter != VisibilityFilter.completed;

  @action
  void addTask(TaskModel taskModel) {
    final task = TaskStore(
        taskModel.title!,
        taskModel.description!,
        taskModel.timerValue!,
        Utils.getDurationFromString(durationString: taskModel.timerValue!));

    taskList.add(task);
  }

  @action
  void removeTask(TaskStore taskStore) {
    taskList.removeWhere((element) => element == taskStore);
  }

  @action
  void changeFilter(VisibilityFilter filter) => this.filter = filter;

  @action
  void removeCompleted() {
    taskList.removeWhere((element) => element.isCompleted);
  }

  @action
  void markAllAsCompleted() {
    for (final task in taskList) {
      task.isCompleted = true;
    }
  }
}
