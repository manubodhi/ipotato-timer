import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:ipotato/constants/files.dart';
import 'package:ipotato/data/local/db/database_helper.dart';
import 'package:ipotato/data/local/db/ipotato_db.dart';
import 'package:ipotato/data/local/models/task_model.dart';
import 'package:ipotato/data/repos/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final DatabaseHelper databaseHelperInstance;
  final AssetsAudioPlayer assetsAudioPlayer;

  TaskRepositoryImpl({
    required this.databaseHelperInstance,
    required this.assetsAudioPlayer,
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

  @override
  Future<void> playSong({String? title, String? description}) async {
    try {
      final audio = Audio(
        Files.westworldThemeMusic,
        metas: Metas(
          title: title ?? "Title",
          artist: description ?? "description",
        ),
      );
      return await assetsAudioPlayer.open(audio, showNotification: true);
    } catch (exception) {
      return;
    }
  }

  @override
  Future<void> stopSong() {
    return assetsAudioPlayer.stop();
  }
}
