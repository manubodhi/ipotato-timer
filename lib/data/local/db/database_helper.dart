import 'package:ipotato/data/local/db/ipotato_db.dart';
import 'package:ipotato/data/local/models/task_model.dart';

abstract class DatabaseHelper {
  Future<int> insertTask({required TaskModel taskModel});
  Future<void> updateTask({required SingleTask dbTaskModel});
  Future<void> deleteTask({required TaskModel taskModel});
  Future<List<TaskModel>> getAllTasks();
}
