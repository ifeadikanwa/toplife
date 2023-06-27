import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("Personality")
class PersonalityTable extends Table {
  @override
  String? get tableName => "personality";

  IntColumn get personId => integer().unique().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get forgiving => integer()();
  IntColumn get responsible => integer()();
  IntColumn get generous => integer()();
  IntColumn get libido => integer()();
  IntColumn get polite => integer()();
  IntColumn get confrontational => integer()();
  IntColumn get rebellious => integer()();
  IntColumn get impulsive => integer()();
  IntColumn get loyal => integer()();
  IntColumn get violent => integer()();
}
