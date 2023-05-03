import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("DepleteStatsFlag")
class DepleteStatsFlagTable extends Table {
  @override
  String? get tableName => "deplete_stats_flag";

  IntColumn get personId => integer().unique().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  BoolColumn get energy => boolean()();
  BoolColumn get hunger => boolean()();
  BoolColumn get mood => boolean()();
  BoolColumn get health => boolean()();
  BoolColumn get athleticism => boolean()();
  BoolColumn get sober => boolean()();
}
