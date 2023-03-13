// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStore, Store {
  Computed<String>? _$timeComputed;

  @override
  String get time => (_$timeComputed ??=
          Computed<String>(() => super.time, name: '_TaskStore.time'))
      .value;

  late final _$countDownTimerAtom =
      Atom(name: '_TaskStore.countDownTimer', context: context);

  @override
  Timer? get countDownTimer {
    _$countDownTimerAtom.reportRead();
    return super.countDownTimer;
  }

  @override
  set countDownTimer(Timer? value) {
    _$countDownTimerAtom.reportWrite(value, super.countDownTimer, () {
      super.countDownTimer = value;
    });
  }

  late final _$idAtom = Atom(name: '_TaskStore.id', context: context);

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$titleAtom = Atom(name: '_TaskStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_TaskStore.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$timerValueAtom =
      Atom(name: '_TaskStore.timerValue', context: context);

  @override
  String get timerValue {
    _$timerValueAtom.reportRead();
    return super.timerValue;
  }

  @override
  set timerValue(String value) {
    _$timerValueAtom.reportWrite(value, super.timerValue, () {
      super.timerValue = value;
    });
  }

  late final _$lastKnownDurationAtom =
      Atom(name: '_TaskStore.lastKnownDuration', context: context);

  @override
  String get lastKnownDuration {
    _$lastKnownDurationAtom.reportRead();
    return super.lastKnownDuration;
  }

  @override
  set lastKnownDuration(String value) {
    _$lastKnownDurationAtom.reportWrite(value, super.lastKnownDuration, () {
      super.lastKnownDuration = value;
    });
  }

  late final _$isStartedAtom =
      Atom(name: '_TaskStore.isStarted', context: context);

  @override
  bool get isStarted {
    _$isStartedAtom.reportRead();
    return super.isStarted;
  }

  @override
  set isStarted(bool value) {
    _$isStartedAtom.reportWrite(value, super.isStarted, () {
      super.isStarted = value;
    });
  }

  late final _$isRunningAtom =
      Atom(name: '_TaskStore.isRunning', context: context);

  @override
  bool get isRunning {
    _$isRunningAtom.reportRead();
    return super.isRunning;
  }

  @override
  set isRunning(bool value) {
    _$isRunningAtom.reportWrite(value, super.isRunning, () {
      super.isRunning = value;
    });
  }

  late final _$isPausedAtom =
      Atom(name: '_TaskStore.isPaused', context: context);

  @override
  bool get isPaused {
    _$isPausedAtom.reportRead();
    return super.isPaused;
  }

  @override
  set isPaused(bool value) {
    _$isPausedAtom.reportWrite(value, super.isPaused, () {
      super.isPaused = value;
    });
  }

  late final _$isResumedAtom =
      Atom(name: '_TaskStore.isResumed', context: context);

  @override
  bool get isResumed {
    _$isResumedAtom.reportRead();
    return super.isResumed;
  }

  @override
  set isResumed(bool value) {
    _$isResumedAtom.reportWrite(value, super.isResumed, () {
      super.isResumed = value;
    });
  }

  late final _$isCompletedAtom =
      Atom(name: '_TaskStore.isCompleted', context: context);

  @override
  bool get isCompleted {
    _$isCompletedAtom.reportRead();
    return super.isCompleted;
  }

  @override
  set isCompleted(bool value) {
    _$isCompletedAtom.reportWrite(value, super.isCompleted, () {
      super.isCompleted = value;
    });
  }

  late final _$isStoppedAtom =
      Atom(name: '_TaskStore.isStopped', context: context);

  @override
  bool get isStopped {
    _$isStoppedAtom.reportRead();
    return super.isStopped;
  }

  @override
  set isStopped(bool value) {
    _$isStoppedAtom.reportWrite(value, super.isStopped, () {
      super.isStopped = value;
    });
  }

  late final _$durationAtom =
      Atom(name: '_TaskStore.duration', context: context);

  @override
  Duration get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(Duration value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  late final _$_TaskStoreActionController =
      ActionController(name: '_TaskStore', context: context);

  @override
  void start() {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.start');
    try {
      return super.start();
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.stop');
    try {
      return super.stop();
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pause() {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.pause');
    try {
      return super.pause();
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
countDownTimer: ${countDownTimer},
id: ${id},
title: ${title},
description: ${description},
timerValue: ${timerValue},
lastKnownDuration: ${lastKnownDuration},
isStarted: ${isStarted},
isRunning: ${isRunning},
isPaused: ${isPaused},
isResumed: ${isResumed},
isCompleted: ${isCompleted},
isStopped: ${isStopped},
duration: ${duration},
time: ${time}
    ''';
  }
}
