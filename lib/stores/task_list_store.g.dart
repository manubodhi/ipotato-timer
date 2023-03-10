// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskListStore on _TaskListStore, Store {
  Computed<ObservableList<TaskStore>>? _$pendingTasksComputed;

  @override
  ObservableList<TaskStore> get pendingTasks => (_$pendingTasksComputed ??=
          Computed<ObservableList<TaskStore>>(() => super.pendingTasks,
              name: '_TaskListStore.pendingTasks'))
      .value;
  Computed<ObservableList<TaskStore>>? _$completedTasksComputed;

  @override
  ObservableList<TaskStore> get completedTasks => (_$completedTasksComputed ??=
          Computed<ObservableList<TaskStore>>(() => super.completedTasks,
              name: '_TaskListStore.completedTasks'))
      .value;
  Computed<bool>? _$hasCompletedTasksComputed;

  @override
  bool get hasCompletedTasks => (_$hasCompletedTasksComputed ??= Computed<bool>(
          () => super.hasCompletedTasks,
          name: '_TaskListStore.hasCompletedTasks'))
      .value;
  Computed<bool>? _$hasPendingTasksComputed;

  @override
  bool get hasPendingTasks =>
      (_$hasPendingTasksComputed ??= Computed<bool>(() => super.hasPendingTasks,
              name: '_TaskListStore.hasPendingTasks'))
          .value;
  Computed<String>? _$tasksTitlesComputed;

  @override
  String get tasksTitles =>
      (_$tasksTitlesComputed ??= Computed<String>(() => super.tasksTitles,
              name: '_TaskListStore.tasksTitles'))
          .value;
  Computed<ObservableList<TaskStore>>? _$visibleTasksComputed;

  @override
  ObservableList<TaskStore> get visibleTasks => (_$visibleTasksComputed ??=
          Computed<ObservableList<TaskStore>>(() => super.visibleTasks,
              name: '_TaskListStore.visibleTasks'))
      .value;
  Computed<bool>? _$canRemoveAllCompletedComputed;

  @override
  bool get canRemoveAllCompleted => (_$canRemoveAllCompletedComputed ??=
          Computed<bool>(() => super.canRemoveAllCompleted,
              name: '_TaskListStore.canRemoveAllCompleted'))
      .value;
  Computed<bool>? _$canMarkAllCompletedComputed;

  @override
  bool get canMarkAllCompleted => (_$canMarkAllCompletedComputed ??=
          Computed<bool>(() => super.canMarkAllCompleted,
              name: '_TaskListStore.canMarkAllCompleted'))
      .value;

  late final _$taskListAtom =
      Atom(name: '_TaskListStore.taskList', context: context);

  @override
  ObservableList<TaskStore> get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(ObservableList<TaskStore> value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  late final _$filterAtom =
      Atom(name: '_TaskListStore.filter', context: context);

  @override
  VisibilityFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(VisibilityFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$_TaskListStoreActionController =
      ActionController(name: '_TaskListStore', context: context);

  @override
  void addTask(TaskModel taskModel) {
    final _$actionInfo = _$_TaskListStoreActionController.startAction(
        name: '_TaskListStore.addTask');
    try {
      return super.addTask(taskModel);
    } finally {
      _$_TaskListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(TaskStore taskStore) {
    final _$actionInfo = _$_TaskListStoreActionController.startAction(
        name: '_TaskListStore.removeTask');
    try {
      return super.removeTask(taskStore);
    } finally {
      _$_TaskListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFilter(VisibilityFilter filter) {
    final _$actionInfo = _$_TaskListStoreActionController.startAction(
        name: '_TaskListStore.changeFilter');
    try {
      return super.changeFilter(filter);
    } finally {
      _$_TaskListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCompleted() {
    final _$actionInfo = _$_TaskListStoreActionController.startAction(
        name: '_TaskListStore.removeCompleted');
    try {
      return super.removeCompleted();
    } finally {
      _$_TaskListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markAllAsCompleted() {
    final _$actionInfo = _$_TaskListStoreActionController.startAction(
        name: '_TaskListStore.markAllAsCompleted');
    try {
      return super.markAllAsCompleted();
    } finally {
      _$_TaskListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskList: ${taskList},
filter: ${filter},
pendingTasks: ${pendingTasks},
completedTasks: ${completedTasks},
hasCompletedTasks: ${hasCompletedTasks},
hasPendingTasks: ${hasPendingTasks},
tasksTitles: ${tasksTitles},
visibleTasks: ${visibleTasks},
canRemoveAllCompleted: ${canRemoveAllCompleted},
canMarkAllCompleted: ${canMarkAllCompleted}
    ''';
  }
}
