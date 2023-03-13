import 'package:ipotato/data/local/models/task_model.dart';

abstract class TaskRepository {
  Future<int> insertTask({required TaskModel task});
  Future<void> updateTask({required TaskModel task});
  Future<void> deleteTask({required TaskModel task});
  Future<void> playSong({String? title, String? description});
  Future<void> stopSong();
  Future<List<TaskModel>> getAllTasks();
  Future<void> deleteAllTasks();
  Future<TaskModel> getSingleTasks({required int id});
}
