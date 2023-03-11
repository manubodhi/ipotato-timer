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
      lastKnownDuration: taskModel.timerValue!,
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
              timerValue: item.lastKnownDuration,
            ))
        .toList();
  }

  @override
  Future<void> insertTask({required TaskModel taskModel}) async {
    dbInstance.insertTask(TaskListCompanion.insert(
      title: taskModel.title!,
      description: taskModel.description!,
      lastKnownDuration: taskModel.timerValue!,
    ));
  }
}
