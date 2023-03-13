import 'package:ipotato/data/local/db/database_helper.dart';
import 'package:ipotato/data/local/db/ipotato_db.dart';
import 'package:ipotato/data/local/models/task_model.dart';
import 'package:ipotato/data/repos/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final DatabaseHelper databaseHelperInstance;

  TaskRepositoryImpl({
    required this.databaseHelperInstance,
  });

  @override
  Future<int> insertTask({required TaskModel task}) async {
    return await databaseHelperInstance.insertTask(taskModel: task);
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
  Future<TaskModel> getSingleTasks({required int id}) {
    return databaseHelperInstance.getSingleTask(id: id);
  }

  @override
  Future<void> deleteAllTasks() async {
    final savedTasks = await getAllTasks();

    if (savedTasks.isNotEmpty) {
      for (TaskModel task in savedTasks) {
        deleteTask(task: task);
      }
    }
  }

  @override
  Future<void> updateTask({required TaskModel task}) async {
    await databaseHelperInstance.updateTask(
        dbTaskModel: SingleTask.fromJson(task.toJson()));
  }
}
