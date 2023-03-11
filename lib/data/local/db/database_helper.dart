import 'package:ipotato/data/local/models/task_model.dart';

abstract class DatabaseHelper {
  Future<void> insertTask({required TaskModel taskModel});
  Future<void> deleteTask({required TaskModel taskModel});
  Future<List<TaskModel>> getAllTasks();
}
