// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskModel _$$_TaskModelFromJson(Map<String, dynamic> json) => _$_TaskModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      timerValue: json['timerValue'] as String?,
      lastKnownDuration: json['lastKnownDuration'] as String?,
      isStarted: json['isStarted'] as bool?,
      isPaused: json['isPaused'] as bool?,
      isResumed: json['isResumed'] as bool?,
      isCompleted: json['isCompleted'] as bool?,
    );

Map<String, dynamic> _$$_TaskModelToJson(_$_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'timerValue': instance.timerValue,
      'lastKnownDuration': instance.lastKnownDuration,
      'isStarted': instance.isStarted,
      'isPaused': instance.isPaused,
      'isResumed': instance.isResumed,
      'isCompleted': instance.isCompleted,
    };
