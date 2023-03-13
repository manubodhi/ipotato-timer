import 'dart:async';
import 'dart:developer';

import 'package:ipotato/data/local/models/task_model.dart';
import 'package:ipotato/data/repos/task_repository.dart';
import 'package:ipotato/di/injector.dart';
import 'package:ipotato/utils/utils.dart';
import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  final TaskRepository taskRepo = locator<TaskRepository>();
  _TaskStore({
    required this.id,
    required this.title,
    required this.description,
    required this.timerValue,
    required this.lastKnownDuration,
    required this.isStarted,
    required this.isPaused,
    required this.isResumed,
    required this.isCompleted,
    required this.duration,
    required this.countDownTimer,
  });

  @observable
  Timer? countDownTimer;

  @observable
  int id;

  @observable
  String title;

  @observable
  String description;

  @observable
  String timerValue;

  @observable
  String lastKnownDuration;

  @observable
  bool isStarted;

  @observable
  bool isRunning = false;

  @observable
  bool isPaused;

  @observable
  bool isResumed;

  @observable
  bool isCompleted;

  @observable
  bool isStopped = false;

  @observable
  Duration duration;

  @computed
  String get time {
    return Utils.getHandsFromDurationString(
      durationString: duration.toString(),
    );
  }

  @action
  void start() {
    countDownTimer?.cancel();
    isRunning = true;
    isStarted = true;
    if (isPaused) {
      isPaused = false;
      isResumed = true;
    }

    countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (duration.inSeconds == 0) {
        log("running duration");
        isCompleted = true;
        updateInDb();

        taskRepo.playSong(description: description, title: title);

        countDownTimer?.cancel();
      } else {
        duration = duration - const Duration(seconds: 1);
      }
    });
  }

  @action
  void stop() {
    if (isRunning) {
      isStopped = true;
      isRunning = false;
    }
    taskRepo.stopSong();
    countDownTimer?.cancel();
  }

  @action
  void pause() {
    if (isRunning) {
      isPaused = true;
      isResumed = false;
      isRunning = false;
    }
    lastKnownDuration = duration.toString();
    updateInDb();
    countDownTimer?.cancel();
  }

  updateInDb() {
    taskRepo.updateTask(
        task: TaskModel(
      description: description,
      id: id,
      isCompleted: isCompleted,
      isPaused: isPaused,
      isResumed: isResumed,
      isStarted: isStarted,
      lastKnownDuration: lastKnownDuration,
      timerValue: timerValue,
      title: title,
    ));
  }
}
