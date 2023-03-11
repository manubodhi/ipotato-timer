import 'package:ipotato/data/local/models/task_model.dart';

abstract class TaskRepository {
  Future<void> createTask({required TaskModel task});
  Future<void> deleteTask({required TaskModel task});
  Future<List<TaskModel>> getAllTasks();
  void startTask();
  void pauseTask();
  void resumeTask();
  void stopTask();
  void markAsCompleteTask();
}
