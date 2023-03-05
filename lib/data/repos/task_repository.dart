import 'package:ipotato/data/local/models/task_model.dart';

abstract class TaskRepository {
  void createTask<TaskModel>();
  void deleteTask();
  void startTask();
  void pauseTask();
  void resumeTask();
  void stopTask();
  void markAsCompleteTask();
}
