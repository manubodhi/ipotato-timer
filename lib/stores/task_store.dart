import 'dart:async';
import 'package:ipotato/data/local/models/task_model.dart';
import 'package:ipotato/data/repos/task_repository.dart';
import 'package:ipotato/di/injector.dart';
import 'package:ipotato/utils/utils.dart';
import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

///Created for each Tasks under the Tasklist
class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  ///Instance of task repo for Db operations
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

  ///Created for this class to track the timer state
  @observable
  bool isRunning = false;

  ///Creating a timer for showing count down
  @observable
  Timer? countDownTimer;

  @observable
  int id;

  @observable
  String title;

  @observable
  String description;

  ///Timer value represents the duration user created
  @observable
  String timerValue;

  ///lastKnownDuration updates each time user pause the timer
  @observable
  String lastKnownDuration;

  @observable
  bool isStarted;

  @observable
  bool isPaused;

  @observable
  bool isResumed;

  @observable
  bool isCompleted;

  @observable
  bool isStopped = false;

  ///Duration is used for creating the timer
  @observable
  Duration duration;

  ///Current time is updated in the UI with help of this getter
  @computed
  String get time {
    ///Hour, Minute, and second is fetched from the duration with the help of
    ///this util function
    return Utils.getHandsFromDurationString(
      durationString: duration.toString(),
    );
  }

  @action
  void start() {
    ///This is where the count down timer starts
    countDownTimer?.cancel();

    isRunning = true;
    isStarted = true;

    if (isPaused) {
      isPaused = false;
      isResumed = true;
    }

    ///This is where the count down timer using the duration
    countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      ///When the timer reaches 0 it will trigger the if clause below
      if (duration.inSeconds == 0) {
        isCompleted = true;

        ///Updates the task details in local db
        updateInDb();

        ///Play the song after completing the task
        taskRepo.playSong(description: description, title: title);

        ///Timer is cancelled after completing the task
        countDownTimer?.cancel();
      } else {
        ///Duration is decresed by 1 second upto the timer reached 0 seconds
        duration = duration - const Duration(seconds: 1);
      }
    });
  }

  @action
  void stop() {
    ///Stopping the timer
    if (isRunning) {
      isStopped = true;
      isRunning = false;
    }

    ///Song is stopped when timer is stopped or removed from the db
    taskRepo.stopSong();

    countDownTimer?.cancel();
  }

  @action
  void pause() {
    ///Timer is paused here
    if (isRunning) {
      isPaused = true;
      isResumed = false;
      isRunning = false;
    }

    ///Saving last duration in variable
    lastKnownDuration = duration.toString();

    ///Updating Db
    updateInDb();

    countDownTimer?.cancel();
  }

  ///Updating Db with current state whenever required
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
      ),
    );
  }
}
