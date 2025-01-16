import 'package:drift/drift.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/person.dart';

//alcohol tolerance means if you drink alcohol your soberness is reduced by (100-alcoholTolerance)% of the alcoholic drink nutrition
//10% alcohol tolerance means you get 90% of the alcoholic drink's effect
//if the alcoholic drink is 30 nutrition, your soberness will be reduced by 27.

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
  IntColumn get mood => integer()();
  IntColumn get health => integer()();
  IntColumn get sober => integer()();
  IntColumn get looks => integer()();
  IntColumn get athleticism => integer()();
  IntColumn get intellect => integer()();
  IntColumn get alcoholTolerance => integer()();
}
