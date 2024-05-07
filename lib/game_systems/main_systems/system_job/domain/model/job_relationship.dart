import 'package:drift/drift.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/model/employment.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/person.dart';

@DataClassName("JobRelationship")
class JobRelationshipTable extends Table {
  @override
  String? get tableName => "job_relationship";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get employmentId => integer().references(
        EmploymentTable,
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
  TextColumn get jobRelationshipType => text()();
  TextColumn get informalRelationshipType => text()();
  IntColumn get jobLevel => integer()();
}
