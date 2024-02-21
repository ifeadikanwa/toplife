import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_school/constants/precollege_naming_suffix.dart';
import 'package:toplife/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';

void main() {
  group("SchoolInfo:", () {
    test(
      "gradingStatsRange is min = 0 and max = 100",
      () => expect(
        SchoolInfo.gradingStatsRange,
        const StatsRange(min: 0, max: 100),
      ),
    );

    group("Precollege: ", () {
      test(
        "defaultPrecollegeNamingSuffix is american",
        () => expect(
          SchoolInfo.defaultPrecollegeNamingSuffix,
          PrecollegeNamingSuffix.american,
        ),
      );

      test(
        "elementarySchoolGradingPercentageAttendance is 60/100",
        () => expect(
          SchoolInfo.elementarySchoolGradingPercentageAttendance,
          60 / 100,
        ),
      );

      test(
        "elementarySchoolGradingPercentageHomework is 40/100",
        () => expect(
          SchoolInfo.elementarySchoolGradingPercentageHomework,
          40 / 100,
        ),
      );

      test(
        "homework and attendance make up 100% of elementary school grading",
        () => expect(
          SchoolInfo.elementarySchoolGradingPercentageHomework +
              SchoolInfo.elementarySchoolGradingPercentageAttendance,
          1,
        ),
      );

      test(
        "standardPrecollegeGradingPercentageAttendance is 10/100",
        () => expect(
          SchoolInfo.standardPrecollegeGradingPercentageAttendance,
          10 / 100,
        ),
      );

      test(
        "standardPrecollegeGradingPercentageHomework is 20/100",
        () => expect(
          SchoolInfo.standardPrecollegeGradingPercentageHomework,
          20 / 100,
        ),
      );

      test(
        "standardPrecollegeGradingPercentagePreviousSchool is 20/100",
        () => expect(
          SchoolInfo.standardPrecollegeGradingPercentagePreviousSchool,
          20 / 100,
        ),
      );

      test(
        "standardPrecollegeGradingPercentageFinalExam is 50/100",
        () => expect(
          SchoolInfo.standardPrecollegeGradingPercentageFinalExam,
          50 / 100,
        ),
      );

      test(
        "homework, previous school grades, final exam and attendance make up 100% of middle and high school grading",
        () => expect(
          SchoolInfo.standardPrecollegeGradingPercentageFinalExam +
              SchoolInfo.standardPrecollegeGradingPercentagePreviousSchool +
              SchoolInfo.standardPrecollegeGradingPercentageAttendance +
              SchoolInfo.standardPrecollegeGradingPercentageHomework,
          1,
        ),
      );

      test(
        "precollegeSchoolmatesPopulationRangePerGender is min = 6 and max = 10",
        () => expect(
          SchoolInfo.precollegeSchoolmatesPopulationRangePerGender,
          const StatsRange(min: 6, max: 10),
        ),
      );

      test(
        "possibleLifeStagesForPrecollegeFaculty includes young adult, adult and elder",
        () => expect(
          SchoolInfo.possibleLifeStagesForPrecollegeFaculty,
          [
            LifeStage.youngAdult,
            LifeStage.adult,
            LifeStage.elder,
          ],
        ),
      );

      group("getRequiredSchoolDays: ", () {
        test(
          "required school days for elementary school is 5",
          () => expect(
            SchoolInfo.getRequiredSchoolDays(
              SchoolType.elementarySchool,
            ),
            5,
          ),
        );

        test(
          "required school days for middle school is 10",
          () => expect(
            SchoolInfo.getRequiredSchoolDays(
              SchoolType.middleSchool,
            ),
            10,
          ),
        );

        test(
          "required school days for high school is 15",
          () => expect(
            SchoolInfo.getRequiredSchoolDays(
              SchoolType.highSchool,
            ),
            15,
          ),
        );

        test(
          "required school days for an non precollege school is 0",
          () => expect(
            SchoolInfo.getRequiredSchoolDays(
              SchoolType.undergraduateSchool,
            ),
            0,
          ),
        );
      });
    });

    group("College:", () {
      test("daysInASemester is 4", () {
        expect(SchoolInfo.daysInASemester, 4);
      });

      test("semesterNotStarted number is 0", () {
        expect(SchoolInfo.semesterNotStarted, 0);
      });

      test("newSemesterGradeReset number is 0", () {
        expect(SchoolInfo.newSemesterGradeReset, 0);
      });

      test("firstSemester number is 1", () {
        expect(SchoolInfo.firstSemester, 1);
      });

      test("noScholarship number is 0", () {
        expect(SchoolInfo.noScholarship, 0);
      });

      test("defaultclassDurationInMinutes is 240", () {
        expect(SchoolInfo.defaultClassDurationInMinutes, 240);
      });

      test("higherclassDurationInMinutes is 300", () {
        expect(SchoolInfo.higherClassDurationInMinutes, 300);
      });

      test("highestclassDurationInMinutes is 360", () {
        expect(SchoolInfo.highestClassDurationInMinutes, 360);
      });

      test("undergraduateDegreeBaseCost is 0", () {
        expect(SchoolInfo.undergraduateDegreeBaseCost, 0);
      });

      test("undergraduateTotalSemesters is 4", () {
        expect(SchoolInfo.undergraduateTotalSemesters, 4);
      });

      test("graduateDegreeBaseCost is 0", () {
        expect(SchoolInfo.graduateDegreeBaseCost, 0);
      });

      test("graduateTotalSemesters is 2", () {
        expect(SchoolInfo.graduateTotalSemesters, 2);
      });

      test("doctorateDegreeBaseCost is 0", () {
        expect(SchoolInfo.doctorateDegreeBaseCost, 0);
      });

      test("doctorateTotalSemesters is 4", () {
        expect(SchoolInfo.doctorateTotalSemesters, 4);
      });

      test("lawSchoolDegreeBaseCost is 0", () {
        expect(SchoolInfo.lawSchoolDegreeBaseCost, 0);
      });

      test("lawSchoolTotalSemesters is 3", () {
        expect(SchoolInfo.lawSchoolTotalSemesters, 3);
      });

      test("nursingSchoolDegreeBaseCost is 0", () {
        expect(SchoolInfo.nursingSchoolDegreeBaseCost, 0);
      });

      test("nursingSchoolTotalSemesters is 3", () {
        expect(SchoolInfo.nursingSchoolTotalSemesters, 3);
      });

      test("pharmacySchoolDegreeBaseCost is 0", () {
        expect(SchoolInfo.pharmacySchoolDegreeBaseCost, 0);
      });

      test("pharmacySchoolTotalSemesters is 3", () {
        expect(SchoolInfo.pharmacySchoolTotalSemesters, 3);
      });

      test("medicalSchoolDegreeBaseCost is 0", () {
        expect(SchoolInfo.medicalSchoolDegreeBaseCost, 0);
      });

      test("medicalSchoolTotalSemesters is 6", () {
        expect(SchoolInfo.medicalSchoolTotalSemesters, 6);
      });

      test("teacherSchoolDegreeBaseCost is 0", () {
        expect(SchoolInfo.teacherSchoolDegreeBaseCost, 0);
      });

      test("teacherSchoolTotalSemesters is 2", () {
        expect(SchoolInfo.teacherSchoolTotalSemesters, 2);
      });
    });
  });
}
