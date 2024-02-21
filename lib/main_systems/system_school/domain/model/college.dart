import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';

@DataClassName("College")
class CollegeTable extends Table {
  @override
  String? get tableName => "college";

  IntColumn get id => integer().autoIncrement()();

  IntColumn get personId => integer().references(
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

  IntColumn get degreeId => integer().references(
        DegreeTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  TextColumn get schoolType => text()();

  IntColumn get attendance => integer()();

  IntColumn get project => integer()();

  IntColumn get courseKnowledge => integer()();

  IntColumn get cumulativeGrade => integer()();

  IntColumn get totalSemesterNumber => integer()();

  IntColumn get currentSemesterNumber => integer()();

  IntColumn get classStartTime => integer()();

  IntColumn get classEndTime => integer()();

  IntColumn get semesterStartDay => integer()();

  IntColumn get tuitionPerSemester => integer()();

  IntColumn get scholarshipPercentage => integer()();

  IntColumn get totalLoanAmount => integer()();

  TextColumn get status => text()();
}
