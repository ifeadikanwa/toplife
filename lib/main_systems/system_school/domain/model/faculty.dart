import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';

@DataClassName("Faculty")
class FacultyTable extends Table {
  @override
  String? get tableName => "faculty";

  IntColumn get personId => integer().unique().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get schoolId => integer().references(
        SchoolTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  TextColumn get role => text()();
}
