import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ipotato/data/local/db/tables.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'ipotato_db.g.dart';

@DriftDatabase(tables: [TaskList])
class IPotatoDatabase extends _$IPotatoDatabase {
  IPotatoDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<SingleTask>> getAllTasks() => select(taskList).get();

  Stream<List<SingleTask>> watchAllTasks() => select(taskList).watch();

  Future<int> insertTask(TaskListCompanion task) => into(taskList).insert(task);

  Future<void> updateTask(SingleTask task) => update(taskList).replace(task);

  Future<void> deleteTask(SingleTask task) => delete(taskList).delete(task);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'idb.sqlite'));
    return NativeDatabase.createInBackground(
      file,
      logStatements: true,
    );
  });
}
