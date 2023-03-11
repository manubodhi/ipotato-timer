import 'package:ipotato/data/local/db/database_helper.dart';
import 'package:ipotato/data/local/models/task_model.dart';
import 'package:ipotato/data/repos/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final DatabaseHelper databaseHelperInstance;

  TaskRepositoryImpl({
    required this.databaseHelperInstance,
  });

  @override
  Future<void> createTask({required TaskModel task}) async {
    await databaseHelperInstance.insertTask(taskModel: task);
  }

  @override
  Future<void> deleteTask({required TaskModel task}) async {
    await databaseHelperInstance.deleteTask(taskModel: task);
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    return await databaseHelperInstance.getAllTasks();
  }

  @override
  void markAsCompleteTask() {
    // TODO: implement markAsCompleteTask
  }

  @override
  void pauseTask() {
    // TODO: implement pauseTask
  }

  @override
  void resumeTask() {
    // TODO: implement resumeTask
  }

  @override
  void startTask() {
    // TODO: implement startTask
  }

  @override
  void stopTask() {
    // TODO: implement stopTask
  }
}
