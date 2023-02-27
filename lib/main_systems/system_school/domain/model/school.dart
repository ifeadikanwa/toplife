import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';

@DataClassName("School")
class SchoolTable extends Table {
  @override
  String? get tableName => "school";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get mainPersonId => integer().references(
        PersonTable,
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
  TextColumn get name => text()();
  IntColumn get grades => integer()();
  IntColumn get attendance => integer()();
  IntColumn get project => integer()();
  IntColumn get exam => integer()();
  IntColumn get classStartTime => integer()();
  IntColumn get classEndTime => integer()();
  IntColumn get totalSemesterNumber => integer()();
  IntColumn get currentSemesterNumber => integer()();
  TextColumn get schoolType => text()();
  IntColumn get semesterStartDay => integer()();
  IntColumn get currentDayInSemester => integer()();
  TextColumn get degreeLevel => text()();
  IntColumn get schoolFeesPerSemester => integer()();
  IntColumn get scholarshipPercentage => integer()();
  IntColumn get totalLoanAmount => integer()();
  BoolColumn get loanProcessed => boolean()();
  // sets next semester start date to apprpriate date after 4 days.
  BoolColumn get hasTakenLeave => boolean()();
  BoolColumn get isActive => boolean()();
  BoolColumn get isCompleted => boolean()();
  BoolColumn get wasExpelled => boolean()();
}
