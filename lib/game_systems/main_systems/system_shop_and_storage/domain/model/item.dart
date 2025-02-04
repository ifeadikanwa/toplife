import 'package:drift/drift.dart';

@DataClassName("Item")
class ItemTable extends Table {
  @override
  String? get tableName => "item";

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  IntColumn get basePrice => integer()();
  IntColumn get count => integer()();
}
