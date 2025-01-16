import 'package:drift/drift.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/model/school.dart';

@DataClassName("Precollege")
class PrecollegeTable extends Table {
  @override
  String? get tableName => "precollege";

  IntColumn get personId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  TextColumn get schoolType => text()();

  IntColumn get currentSchoolId => integer().references(
        SchoolTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  //I have to be able to indicate that NPCs should not show up in the list of schoolmates
  //if they die or move out of the lifestage for the precollege, we just make this false
  //This is necessary because I can't simply delete their precollege record, It should still exist even if they've moved on
  BoolColumn get active => boolean()();

  IntColumn get attendance => integer()();

  IntColumn get lastSchoolAttendanceDay => integer()();

  IntColumn get homework => integer()();

  IntColumn get lastHomeworkSubmissionDay => integer()();

  IntColumn get courseKnowledge => integer()();

  //player has to attend the last day of school to do the final exam, we use this in grading
  //this is basically course knowledge but approved because they took the final exam and applied it
  //if they don't take the final exam this will be zero even if they have 100% course knowledge
  IntColumn get finalExam => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {
        personId,
        schoolType,
      };
}
