import 'package:ipotato/data/local/db/database_helper.dart';
import 'package:ipotato/data/local/db/database_helper_impl.dart';
import 'package:ipotato/data/repos/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final DatabaseHelperImpl databaseHelperInstance;

  TaskRepositoryImpl({
    required this.databaseHelperInstance,
  });

  @override
  void createTask<TaskModel>() {
    // TODO: implement createTask
  }

  @override
  void deleteTask() {
    // TODO: implement deleteTask
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
