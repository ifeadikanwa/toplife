import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("Stats")
class StatsTable extends Table {
  @override
  String? get tableName => "stats";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get personId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get energy => integer()();
  IntColumn get hunger => integer()();
  IntColumn get wellbeing => integer()();
  IntColumn get health => integer()();
  IntColumn get sober => integer()();
  IntColumn get looks => integer()();
  IntColumn get athleticism => integer()();
  IntColumn get intellect => integer()();
}
