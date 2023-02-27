import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';

@DataClassName("SchoolRelationship")
class SchoolRelationshipTable extends Table {
  @override
  String? get tableName => "school_relationship";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get schoolId => integer().references(
        SchoolTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get mainPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get otherPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get schoolRelationshipType => text()();
  TextColumn get informalRelationshipType => text()();
  IntColumn get grades => integer()();
  BoolColumn get professional => boolean()();
  BoolColumn get helpful => boolean()();
  TextColumn get personalityType => text()();
}
