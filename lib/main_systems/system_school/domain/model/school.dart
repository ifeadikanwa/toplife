import 'package:drift/drift.dart';

@DataClassName("School")
class SchoolTable extends Table {
  @override
  String? get tableName => "school";

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get state => text()();

  TextColumn get country => text()();

  TextColumn get tier => text()();
}
