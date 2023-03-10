import 'package:ipotato/data/local/db/database_helper.dart';
import 'package:ipotato/data/local/db/task_db.dart';
import 'package:ipotato/data/local/models/task_model.dart';

class DatabaseHelperImpl extends DatabaseHelper {
  TaskDb taskDbInstance;
  DatabaseHelperImpl({
    required this.taskDbInstance,
  });

  @override
  Future<void> deleteTask(TaskModel taskModel) async {
    // TODO: implement deleteTask
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }

  @override
  Future<void> insertTask(TaskModel taskModel) async {}
}
