// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  TaskModel({
    this.id,
    this.title,
    this.description,
    this.timerValue,
    this.isStarted,
    this.isPaused,
    this.isResumed,
    this.isStopped,
    this.isCompleted,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? timerValue;
  final bool? isStarted;
  final bool? isPaused;
  final bool? isResumed;
  final bool? isStopped;
  final bool? isCompleted;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        timerValue: json["timerValue"],
        isStarted: json["isStarted"],
        isPaused: json["isPaused"],
        isResumed: json["isResumed"],
        isStopped: json["isStopped"],
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "timerValue": timerValue,
        "isStarted": isStarted,
        "isPaused": isPaused,
        "isResumed": isResumed,
        "isStopped": isStopped,
        "isCompleted": isCompleted,
      };
}
