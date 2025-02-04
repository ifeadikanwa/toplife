import 'package:drift/drift.dart';

@DataClassName("Degree")
class DegreeTable extends Table {
  @override
  String? get tableName => "degree";

  IntColumn get id => integer().autoIncrement()();
  TextColumn get discipline => text()();
  TextColumn get branch => text()();
  BoolColumn get isSpecialDegree => boolean()();
}
