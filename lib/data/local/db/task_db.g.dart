// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_db.dart';

// ignore_for_file: type=lint
class $TaskDbTable extends TaskDb with TableInfo<$TaskDbTable, TaskDbData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskDbTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, lastKnownDuration];
  @override
  String get aliasedName => _alias ?? 'task_db';
  @override
  String get actualTableName => 'task_db';
  @override
  VerificationContext validateIntegrity(Insertable<TaskDbData> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskDbData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskDbData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      lastKnownDuration: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}lastKnownDuration'])!,
    );
  }

  @override
  $TaskDbTable createAlias(String alias) {
    return $TaskDbTable(attachedDatabase, alias);
  }
}

class TaskDbData extends DataClass implements Insertable<TaskDbData> {
  final int id;
  final String title;
  final String description;
  final String lastKnownDuration;
  const TaskDbData(
      {required this.id,
      required this.title,
      required this.description,
      required this.lastKnownDuration});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['lastKnownDuration'] = Variable<String>(lastKnownDuration);
    return map;
  }

  TaskDbCompanion toCompanion(bool nullToAbsent) {
    return TaskDbCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      lastKnownDuration: Value(lastKnownDuration),
    );
  }

  factory TaskDbData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskDbData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      lastKnownDuration: serializer.fromJson<String>(json['lastKnownDuration']),
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
    };
  }

  TaskDbData copyWith(
          {int? id,
          String? title,
          String? description,
          String? lastKnownDuration}) =>
      TaskDbData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        lastKnownDuration: lastKnownDuration ?? this.lastKnownDuration,
      );
  @override
  String toString() {
    return (StringBuffer('TaskDbData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('lastKnownDuration: $lastKnownDuration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, lastKnownDuration);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskDbData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.lastKnownDuration == this.lastKnownDuration);
}

class TaskDbCompanion extends UpdateCompanion<TaskDbData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> lastKnownDuration;
  const TaskDbCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.lastKnownDuration = const Value.absent(),
  });
  TaskDbCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String lastKnownDuration,
  })  : title = Value(title),
        description = Value(description),
        lastKnownDuration = Value(lastKnownDuration);
  static Insertable<TaskDbData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? lastKnownDuration,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (lastKnownDuration != null) 'lastKnownDuration': lastKnownDuration,
    });
  }

  TaskDbCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? lastKnownDuration}) {
    return TaskDbCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      lastKnownDuration: lastKnownDuration ?? this.lastKnownDuration,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskDbCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('lastKnownDuration: $lastKnownDuration')
          ..write(')'))
        .toString();
  }
}

abstract class _$IPotatoDatabase extends GeneratedDatabase {
  _$IPotatoDatabase(QueryExecutor e) : super(e);
  late final $TaskDbTable taskDb = $TaskDbTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskDb];
}
