import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/precollege_naming_suffix.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_type.dart';

class SchoolInfo {
  static const StatsRange gradingStatsRange = StatsRange(min: 0, max: 100);

  //precollege
  static const defaultPrecollegeNamingSuffix = PrecollegeNamingSuffix.american;

  //-elementary grading = attendance(60%) + homework(40%)
  static const elementarySchoolGradingPercentageAttendance = 60 / 100;
  static const elementarySchoolGradingPercentageHomework = 40 / 100;

  //-standard grading (middle and high school)
  static const standardPrecollegeGradingPercentageAttendance = 10 / 100;
  static const standardPrecollegeGradingPercentageHomework = 20 / 100;
  static const standardPrecollegeGradingPercentagePreviousSchool = 20 / 100;
  static const standardPrecollegeGradingPercentageFinalExam = 50 / 100;

  //population (per gender)
  //that means the combined will be min (6*2 = 12) - max (10*2 = 20)
  static const precollegeSchoolmatesPopulationRangePerGender = StatsRange(
    min: 6,
    max: 10,
  );

  //possible lifestages for faculty
  static const List<LifeStage> possibleLifeStagesForPrecollegeFaculty = [
    LifeStage.youngAdult,
    LifeStage.adult,
    LifeStage.elder,
  ];

  //required attendance for precollege
  static int getRequiredSchoolDays(SchoolType schoolType) {
    //we are returning the number of weekdays are in the lifestage for the precollege
    //every lifestage lasts a multiple of 7 days
    //so we can safely assume that for there are always 5 weekdays for every 7 days
    //if we find out how how many 7 days are in the entire lifestage, we can use that number to multiply 5  and get the weekdays

    late final int lifestageDuration;
    switch (schoolType) {
      case SchoolType.elementarySchool:
        lifestageDuration = LifeStage.toddler.stageDuration;
        break;
      case SchoolType.middleSchool:
        lifestageDuration = LifeStage.child.stageDuration;
        break;
      case SchoolType.highSchool:
        lifestageDuration = LifeStage.teen.stageDuration;
        break;
      default:
        lifestageDuration = 0;
        break;
    }

    //find the number of weekdays and return it
    return (lifestageDuration ~/ 7) * 5;
  }

  //college
  static const daysInASemester = 4;

  static const semesterNotStarted = 0;

  static const newSemesterGradeReset = 0;

  static const firstSemester = 1;

  static const noScholarship = 0;

  static const defaultClassDurationInMinutes = 240; //4 hours
  static const higherClassDurationInMinutes = 300; //5 hours
  static const highestClassDurationInMinutes = 360; //6 hours

  static const undergraduateDegreeBaseCost = 0;
  static const undergraduateTotalSemesters = 4;

  static const graduateDegreeBaseCost = 0;
  static const graduateTotalSemesters = 2;

  static const doctorateDegreeBaseCost = 0;
  static const doctorateTotalSemesters = 4;

  static const lawSchoolDegreeBaseCost = 0;
  static const lawSchoolTotalSemesters = 3;

  static const nursingSchoolDegreeBaseCost = 0;
  static const nursingSchoolTotalSemesters = 3;

  static const pharmacySchoolDegreeBaseCost = 0;
  static const pharmacySchoolTotalSemesters = 3;

  static const medicalSchoolDegreeBaseCost = 0;
  static const medicalSchoolTotalSemesters = 6;

  static const teacherSchoolDegreeBaseCost = 0;
  static const teacherSchoolTotalSemesters = 2;
}
