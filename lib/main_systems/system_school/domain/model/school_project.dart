import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';

@DataClassName("SchoolProject")
class SchoolProjectTable extends Table {
  @override
  String? get tableName => "school_project";

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
  IntColumn get projectPartnerSchoolRelationshipId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get semesterNumber => integer()();
  IntColumn get mainPersonContribution => integer()();
  IntColumn get projectPartnerContribution => integer()();
  BoolColumn get projectPartnerWillContribute => boolean()();
}
