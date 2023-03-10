import 'package:ipotato/data/local/models/task_model.dart';

abstract class DatabaseHelper {
  Future<void> insertTask(TaskModel taskModel);
  Future<void> deleteTask(TaskModel taskModel);
  Future<List<TaskModel>> getAllTasks();
}
