import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/util/generate_precollege_with_no_grade.dart';

void main() {
  group("generatePrecollegeWithNoGrade: ", () {
    test("returns precollege object with correct information", () {
      const int personId = 9;
      const SchoolType schoolType = SchoolType.middleSchool;
      const int schoolId = 7;
      const bool active = false;

      expect(
        generatePrecollegeWithNoGrade(
          studentID: personId,
          precollegeSchoolType: schoolType,
          schoolID: schoolId,
          active: active,
        ),
        Precollege(
          personId: personId,
          schoolType: schoolType.name,
          currentSchoolId: schoolId,
          active: active,
          attendance: 0,
          homework: 0,
          courseKnowledge: 0,
          finalExam: 0,
          lastHomeworkSubmissionDay: 0,
          lastSchoolAttendanceDay: 0,
        ),
      );
    });
  });
}
