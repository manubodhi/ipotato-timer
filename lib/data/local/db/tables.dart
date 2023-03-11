import 'package:drift/drift.dart';

@DataClassName('SingleTask')
class TaskList extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 32)();
  TextColumn get description => text().named('description')();
  TextColumn get lastKnownDuration => text().named('lastKnownDuration')();
}
