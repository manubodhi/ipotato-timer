import 'dart:async';

import 'package:ipotato/utils/utils.dart';
import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  _TaskStore(
    this.title,
    this.description,
    this.lastKnownDuration,
    this.duration,
  );

  Timer? countDownTimer;

  @observable
  Duration duration;

  @observable
  String title = '';

  @observable
  String description = '';

  @observable
  String lastKnownDuration = '';

  @observable
  bool isCompleted = false;

  @observable
  bool isRunning = false;

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
    countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (duration.inSeconds == 0) {
        isCompleted = true;
      } else {
        duration -= Duration(seconds: 1);
      }
    });
  }

  @action
  void stop() {
    if (isRunning) {
      isRunning = false;
    }
    countDownTimer?.cancel();
  }

  @action
  void pause() {
    if (isRunning) {
      isRunning = false;
    }
    lastKnownDuration = countDownTimer.toString();
    countDownTimer?.cancel();
  }
}
