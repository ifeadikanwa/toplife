import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';
import 'package:toplife/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/util/generate_precollege_with_random_grade.dart';

void main() {
  const studentID = 7;
  const schoolID = 8;
  const bool active = true;

  group("generatePrecollegeWithRandomGrade: ", () {
    test(
      "low grade group max is 50",
      () => expect(
        lowGradeGroupMax,
        50,
      ),
    );
    test(
      "mid grade group max is 70",
      () => expect(
        midGradeGroupMax,
        70,
      ),
    );
    test(
      "high grade group max is 100",
      () => expect(
        highGradeGroupMax,
        100,
      ),
    );

    test(
        "given a low grade intelligence stat for a high school student, we get precollege with attendance, homework, course knowledge and final exam in the low range",
        () {
      const SchoolType precollegeSchoolType = SchoolType.highSchool;
      const int intelligenceStats = 25;

      final int requiredSchoolDays =
          SchoolInfo.getRequiredSchoolDays(precollegeSchoolType);
      final attendanceAndHomeworkRange = StatsRange(
        min: (0 * requiredSchoolDays).round(),
        max: (0.5 * requiredSchoolDays).round(),
      );
      const courseKnowledgeAndFinalExamRange = StatsRange(min: 0, max: 50);

      final Precollege result = generatePrecollegeWithRandomGrade(
        studentID: studentID,
        precollegeSchoolType: precollegeSchoolType,
        schoolID: schoolID,
        active: active,
        intelligenceStats: intelligenceStats,
      );

      expect(
        result.attendance,
        inInclusiveRange(
          attendanceAndHomeworkRange.min,
          attendanceAndHomeworkRange.max,
        ),
        reason: "Cause: attendance",
      );

      expect(
        result.homework,
        inInclusiveRange(
          attendanceAndHomeworkRange.min,
          attendanceAndHomeworkRange.max,
        ),
        reason: "Cause: homework",
      );

      expect(
        result.courseKnowledge,
        inInclusiveRange(
          courseKnowledgeAndFinalExamRange.min,
          courseKnowledgeAndFinalExamRange.max,
        ),
        reason: "Cause: course knowledge",
      );

      expect(
        result.finalExam,
        inInclusiveRange(
          courseKnowledgeAndFinalExamRange.min,
          courseKnowledgeAndFinalExamRange.max,
        ),
        reason: "Cause: final exam",
      );

      expect(
        result.courseKnowledge,
        result.finalExam,
        reason: "Cause: course knowledge and final exam are not equal",
      );
    });

    test(
        "given a mid grade intelligence stat for a middle school student, we get precollege with attendance, homework, course knowledge and final exam in the mid range",
        () {
      const SchoolType precollegeSchoolType = SchoolType.middleSchool;
      const int intelligenceStats = 67;
      final int requiredSchoolDays =
          SchoolInfo.getRequiredSchoolDays(precollegeSchoolType);
      final attendanceAndHomeworkRange = StatsRange(
        min: (0.5 * requiredSchoolDays).round(),
        max: (0.7 * requiredSchoolDays).round(),
      );
      const courseKnowledgeAndFinalExamRange = StatsRange(min: 50, max: 70);

      final Precollege result = generatePrecollegeWithRandomGrade(
        studentID: studentID,
        precollegeSchoolType: precollegeSchoolType,
        schoolID: schoolID,
        active: active,
        intelligenceStats: intelligenceStats,
      );

      expect(
        result.attendance,
        inInclusiveRange(
          attendanceAndHomeworkRange.min,
          attendanceAndHomeworkRange.max,
        ),
        reason: "Cause: attendance",
      );

      expect(
        result.homework,
        inInclusiveRange(
          attendanceAndHomeworkRange.min,
          attendanceAndHomeworkRange.max,
        ),
        reason: "Cause: homework",
      );

      expect(
        result.courseKnowledge,
        inInclusiveRange(
          courseKnowledgeAndFinalExamRange.min,
          courseKnowledgeAndFinalExamRange.max,
        ),
        reason: "Cause: course knowledge",
      );

      expect(
        result.finalExam,
        inInclusiveRange(
          courseKnowledgeAndFinalExamRange.min,
          courseKnowledgeAndFinalExamRange.max,
        ),
        reason: "Cause: final exam",
      );

      expect(
        result.courseKnowledge,
        result.finalExam,
        reason: "Cause: course knowledge and final exam are not equal",
      );
    });

    test(
        "given a high grade intelligence stat for a high school student, we get precollege with attendance, homework, course knowledge and final exam in the high range",
        () {
      const SchoolType precollegeSchoolType = SchoolType.highSchool;
      const int intelligenceStats = 89;
      final int requiredSchoolDays =
          SchoolInfo.getRequiredSchoolDays(precollegeSchoolType);
      final attendanceAndHomeworkRange = StatsRange(
        min: (0.7 * requiredSchoolDays).round(),
        max: (1.0 * requiredSchoolDays).round(),
      );
      const courseKnowledgeAndFinalExamRange = StatsRange(min: 70, max: 100);

      final Precollege result = generatePrecollegeWithRandomGrade(
        studentID: studentID,
        precollegeSchoolType: precollegeSchoolType,
        schoolID: schoolID,
        active: active,
        intelligenceStats: intelligenceStats,
      );

      expect(
        result.attendance,
        inInclusiveRange(
          attendanceAndHomeworkRange.min,
          attendanceAndHomeworkRange.max,
        ),
        reason: "Cause: attendance",
      );

      expect(
        result.homework,
        inInclusiveRange(
          attendanceAndHomeworkRange.min,
          attendanceAndHomeworkRange.max,
        ),
        reason: "Cause: homework",
      );

      expect(
        result.courseKnowledge,
        inInclusiveRange(
          courseKnowledgeAndFinalExamRange.min,
          courseKnowledgeAndFinalExamRange.max,
        ),
        reason: "Cause: course knowledge",
      );

      expect(
        result.finalExam,
        inInclusiveRange(
          courseKnowledgeAndFinalExamRange.min,
          courseKnowledgeAndFinalExamRange.max,
        ),
        reason: "Cause: final exam",
      );

      expect(
        result.courseKnowledge,
        result.finalExam,
        reason: "Cause: course knowledge and final exam are not equal",
      );
    });

    test(
        "given a non precollege, we get precollege with 0 for attendance, homework, course knowledge and final exam",
        () {
      const SchoolType precollegeSchoolType = SchoolType.doctorateSchool;
      const int intelligenceStats = 89;

      final Precollege result = generatePrecollegeWithRandomGrade(
        studentID: studentID,
        precollegeSchoolType: precollegeSchoolType,
        schoolID: schoolID,
        active: active,
        intelligenceStats: intelligenceStats,
      );

      expect(
        result,
        Precollege(
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
        ),
      );
    });
  });
}
