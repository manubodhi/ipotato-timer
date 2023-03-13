import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:ipotato/data/local/db/database_helper.dart';
import 'package:ipotato/data/local/db/ipotato_db.dart';
import 'package:ipotato/data/local/models/task_model.dart';

class DatabaseHelperImpl extends DatabaseHelper {
  IPotatoDatabase dbInstance;
  DatabaseHelperImpl({
    required this.dbInstance,
  });

  @override
  Future<void> deleteTask({required TaskModel taskModel}) async {
    dbInstance.deleteTask(SingleTask(
      id: taskModel.id!,
      title: taskModel.title!,
      description: taskModel.description!,
      lastKnownDuration: taskModel.lastKnownDuration!,
      timerValue: taskModel.timerValue!,
      isCompleted: taskModel.isCompleted!,
      isPaused: taskModel.isPaused!,
      isResumed: taskModel.isResumed!,
      isStarted: taskModel.isStarted!,
    ));
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    final list = await dbInstance.getAllTasks();

    print('Categories in database: $list');

    return list
        .map((item) => TaskModel(
              id: item.id,
              title: item.title,
              description: item.description,
              isCompleted: item.isCompleted,
              isPaused: item.isPaused,
              isResumed: item.isResumed,
              isStarted: item.isStarted,
              lastKnownDuration: item.lastKnownDuration,
              timerValue: item.timerValue,
            ))
        .toList();
  }

  @override
  Future<int> insertTask({required TaskModel taskModel}) async {
    log('timer value ${taskModel.timerValue}');
    return dbInstance.insertTask(TaskListCompanion.insert(
      title: taskModel.title!,
      description: taskModel.description!,
      lastKnownDuration: taskModel.lastKnownDuration!,
      timerValue: taskModel.timerValue!,
      isCompleted: Value(taskModel.isCompleted!),
      isPaused: Value(taskModel.isPaused!),
      isResumed: Value(taskModel.isResumed!),
      isStarted: Value(taskModel.isStarted!),
    ));
  }

  @override
  Future<TaskModel> getSingleTask({required int id}) async {
    //TODO
    return const TaskModel();
  }

  @override
  Future<void> updateTask({required SingleTask dbTaskModel}) {
    return dbInstance.updateTask(dbTaskModel);
  }
}
