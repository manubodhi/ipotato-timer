// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipotato_db.dart';

// ignore_for_file: type=lint
class $TaskListTable extends TaskList
    with TableInfo<$TaskListTable, SingleTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskListTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastKnownDurationMeta =
      const VerificationMeta('lastKnownDuration');
  @override
  late final GeneratedColumn<String> lastKnownDuration =
      GeneratedColumn<String>('lastKnownDuration', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timerValueMeta =
      const VerificationMeta('timerValue');
  @override
  late final GeneratedColumn<String> timerValue = GeneratedColumn<String>(
      'timerValue', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted =
      GeneratedColumn<bool>('is_completed', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_completed" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _isStartedMeta =
      const VerificationMeta('isStarted');
  @override
  late final GeneratedColumn<bool> isStarted =
      GeneratedColumn<bool>('is_started', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_started" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _isPausedMeta =
      const VerificationMeta('isPaused');
  @override
  late final GeneratedColumn<bool> isPaused =
      GeneratedColumn<bool>('is_paused', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_paused" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _isResumedMeta =
      const VerificationMeta('isResumed');
  @override
  late final GeneratedColumn<bool> isResumed =
      GeneratedColumn<bool>('is_resumed', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_resumed" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        lastKnownDuration,
        timerValue,
        isCompleted,
        isStarted,
        isPaused,
        isResumed
      ];
  @override
  String get aliasedName => _alias ?? 'task_list';
  @override
  String get actualTableName => 'task_list';
  @override
  VerificationContext validateIntegrity(Insertable<SingleTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('lastKnownDuration')) {
      context.handle(
          _lastKnownDurationMeta,
          lastKnownDuration.isAcceptableOrUnknown(
              data['lastKnownDuration']!, _lastKnownDurationMeta));
    } else if (isInserting) {
      context.missing(_lastKnownDurationMeta);
    }
    if (data.containsKey('timerValue')) {
      context.handle(
          _timerValueMeta,
          timerValue.isAcceptableOrUnknown(
              data['timerValue']!, _timerValueMeta));
    } else if (isInserting) {
      context.missing(_timerValueMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    if (data.containsKey('is_started')) {
      context.handle(_isStartedMeta,
          isStarted.isAcceptableOrUnknown(data['is_started']!, _isStartedMeta));
    }
    if (data.containsKey('is_paused')) {
      context.handle(_isPausedMeta,
          isPaused.isAcceptableOrUnknown(data['is_paused']!, _isPausedMeta));
    }
    if (data.containsKey('is_resumed')) {
      context.handle(_isResumedMeta,
          isResumed.isAcceptableOrUnknown(data['is_resumed']!, _isResumedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SingleTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SingleTask(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      lastKnownDuration: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}lastKnownDuration'])!,
      timerValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}timerValue'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      isStarted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_started'])!,
      isPaused: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_paused'])!,
      isResumed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_resumed'])!,
    );
  }

  @override
  $TaskListTable createAlias(String alias) {
    return $TaskListTable(attachedDatabase, alias);
  }
}

class SingleTask extends DataClass implements Insertable<SingleTask> {
  final int id;
  final String title;
  final String description;
  final String lastKnownDuration;
  final String timerValue;
  final bool isCompleted;
  final bool isStarted;
  final bool isPaused;
  final bool isResumed;
  const SingleTask(
      {required this.id,
      required this.title,
      required this.description,
      required this.lastKnownDuration,
      required this.timerValue,
      required this.isCompleted,
      required this.isStarted,
      required this.isPaused,
      required this.isResumed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['lastKnownDuration'] = Variable<String>(lastKnownDuration);
    map['timerValue'] = Variable<String>(timerValue);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['is_started'] = Variable<bool>(isStarted);
    map['is_paused'] = Variable<bool>(isPaused);
    map['is_resumed'] = Variable<bool>(isResumed);
    return map;
  }

  TaskListCompanion toCompanion(bool nullToAbsent) {
    return TaskListCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      lastKnownDuration: Value(lastKnownDuration),
      timerValue: Value(timerValue),
      isCompleted: Value(isCompleted),
      isStarted: Value(isStarted),
      isPaused: Value(isPaused),
      isResumed: Value(isResumed),
    );
  }

  factory SingleTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SingleTask(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      lastKnownDuration: serializer.fromJson<String>(json['lastKnownDuration']),
      timerValue: serializer.fromJson<String>(json['timerValue']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      isStarted: serializer.fromJson<bool>(json['isStarted']),
      isPaused: serializer.fromJson<bool>(json['isPaused']),
      isResumed: serializer.fromJson<bool>(json['isResumed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'lastKnownDuration': serializer.toJson<String>(lastKnownDuration),
      'timerValue': serializer.toJson<String>(timerValue),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'isStarted': serializer.toJson<bool>(isStarted),
      'isPaused': serializer.toJson<bool>(isPaused),
      'isResumed': serializer.toJson<bool>(isResumed),
    };
  }

  SingleTask copyWith(
          {int? id,
          String? title,
          String? description,
          String? lastKnownDuration,
          String? timerValue,
          bool? isCompleted,
          bool? isStarted,
          bool? isPaused,
          bool? isResumed}) =>
      SingleTask(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        lastKnownDuration: lastKnownDuration ?? this.lastKnownDuration,
        timerValue: timerValue ?? this.timerValue,
        isCompleted: isCompleted ?? this.isCompleted,
        isStarted: isStarted ?? this.isStarted,
        isPaused: isPaused ?? this.isPaused,
        isResumed: isResumed ?? this.isResumed,
      );
  @override
  String toString() {
    return (StringBuffer('SingleTask(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('lastKnownDuration: $lastKnownDuration, ')
          ..write('timerValue: $timerValue, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isStarted: $isStarted, ')
          ..write('isPaused: $isPaused, ')
          ..write('isResumed: $isResumed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, lastKnownDuration,
      timerValue, isCompleted, isStarted, isPaused, isResumed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SingleTask &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.lastKnownDuration == this.lastKnownDuration &&
          other.timerValue == this.timerValue &&
          other.isCompleted == this.isCompleted &&
          other.isStarted == this.isStarted &&
          other.isPaused == this.isPaused &&
          other.isResumed == this.isResumed);
}

class TaskListCompanion extends UpdateCompanion<SingleTask> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> lastKnownDuration;
  final Value<String> timerValue;
  final Value<bool> isCompleted;
  final Value<bool> isStarted;
  final Value<bool> isPaused;
  final Value<bool> isResumed;
  const TaskListCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.lastKnownDuration = const Value.absent(),
    this.timerValue = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.isStarted = const Value.absent(),
    this.isPaused = const Value.absent(),
    this.isResumed = const Value.absent(),
  });
  TaskListCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String lastKnownDuration,
    required String timerValue,
    this.isCompleted = const Value.absent(),
    this.isStarted = const Value.absent(),
    this.isPaused = const Value.absent(),
    this.isResumed = const Value.absent(),
  })  : title = Value(title),
        description = Value(description),
        lastKnownDuration = Value(lastKnownDuration),
        timerValue = Value(timerValue);
  static Insertable<SingleTask> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? lastKnownDuration,
    Expression<String>? timerValue,
    Expression<bool>? isCompleted,
    Expression<bool>? isStarted,
    Expression<bool>? isPaused,
    Expression<bool>? isResumed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (lastKnownDuration != null) 'lastKnownDuration': lastKnownDuration,
      if (timerValue != null) 'timerValue': timerValue,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (isStarted != null) 'is_started': isStarted,
      if (isPaused != null) 'is_paused': isPaused,
      if (isResumed != null) 'is_resumed': isResumed,
    });
  }

  TaskListCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? lastKnownDuration,
      Value<String>? timerValue,
      Value<bool>? isCompleted,
      Value<bool>? isStarted,
      Value<bool>? isPaused,
      Value<bool>? isResumed}) {
    return TaskListCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      lastKnownDuration: lastKnownDuration ?? this.lastKnownDuration,
      timerValue: timerValue ?? this.timerValue,
      isCompleted: isCompleted ?? this.isCompleted,
      isStarted: isStarted ?? this.isStarted,
      isPaused: isPaused ?? this.isPaused,
      isResumed: isResumed ?? this.isResumed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (lastKnownDuration.present) {
      map['lastKnownDuration'] = Variable<String>(lastKnownDuration.value);
    }
    if (timerValue.present) {
      map['timerValue'] = Variable<String>(timerValue.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (isStarted.present) {
      map['is_started'] = Variable<bool>(isStarted.value);
    }
    if (isPaused.present) {
      map['is_paused'] = Variable<bool>(isPaused.value);
    }
    if (isResumed.present) {
      map['is_resumed'] = Variable<bool>(isResumed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskListCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('lastKnownDuration: $lastKnownDuration, ')
          ..write('timerValue: $timerValue, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isStarted: $isStarted, ')
          ..write('isPaused: $isPaused, ')
          ..write('isResumed: $isResumed')
          ..write(')'))
        .toString();
  }
}

abstract class _$IPotatoDatabase extends GeneratedDatabase {
  _$IPotatoDatabase(QueryExecutor e) : super(e);
  late final $TaskListTable taskList = $TaskListTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskList];
}
