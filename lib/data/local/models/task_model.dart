// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    int? id,
    String? title,
    String? description,
    String? timerValue,
    String? lastKnownDuration,
    bool? isStarted,
    bool? isPaused,
    bool? isResumed,
    bool? isCompleted,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
