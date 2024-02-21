import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';

Precollege generatePrecollegeWithNoGrade({
  required int studentID,
  required SchoolType precollegeSchoolType,
  required int schoolID,
  required bool active,
}) {
  return Precollege(
    personId: studentID,
    schoolType: precollegeSchoolType.name,
    currentSchoolId: schoolID,
    active: active,
    attendance: 0,
    homework: 0,
    courseKnowledge: 0,
    finalExam: 0,
    lastHomeworkSubmissionDay: 0,
    lastSchoolAttendanceDay: 0,
  );
}
