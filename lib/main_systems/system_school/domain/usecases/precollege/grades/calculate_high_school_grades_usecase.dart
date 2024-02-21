import 'package:toplife/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/precollege_info.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/grades/calculate_middle_school_grades_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/manage/get_specific_precollege_school_usecase.dart';
import 'package:toplife/main_systems/system_school/util/get_precollege_attendance_percentage.dart';
import 'package:toplife/main_systems/system_school/util/get_precollege_homework_percentage.dart';

class CalculateHighSchoolGradesUsecase {
  final GetSpecificPrecollegeSchoolUsecase _getSpecificPrecollegeSchoolUsecase;
  final CalculateMiddleSchoolGradesUsecase _calculateMiddleSchoolGradesUsecase;

  const CalculateHighSchoolGradesUsecase(
    this._getSpecificPrecollegeSchoolUsecase,
    this._calculateMiddleSchoolGradesUsecase,
  );

  Future<int> execute({
    required int personID,
  }) async {
    //get the high school precollege record
    final PrecollegeInfo? highSchoolInfo =
        await _getSpecificPrecollegeSchoolUsecase.execute(
      personID: personID,
      precollegeSchoolType: SchoolType.highSchool,
    );

    //if we have a valid record
    if (highSchoolInfo != null) {
      //Do the calculations

      //high school grades are determined by
      //-attendance
      //-homework
      //-middle school grade
      //-final exam

      //attendance percentage
      final int attendancePercentage = getPrecollegeAttendancePercentage(
        attendanceDays: highSchoolInfo.precollege.attendance,
        precollegeSchoolType: highSchoolInfo.schoolType,
      );

      //homework percentage
      final int homeworkPercentage = getPrecollegeHomeworkPercentage(
        submittedHomework: highSchoolInfo.precollege.homework,
        precollegeSchoolType: highSchoolInfo.schoolType,
      );

      //middle school grade
      final int middleSchoolGrade =
          await _calculateMiddleSchoolGradesUsecase.execute(
        personID: personID,
      );

      //final exam score
      final int finalExamScore = highSchoolInfo.precollege.finalExam;

      //final grade
      //we convert the percentages to their grade percentage
      //that is how much of the final 100% does attendance decide, homework decide etc
      final double grade = (attendancePercentage *
              SchoolInfo.standardPrecollegeGradingPercentageAttendance) +
          (homeworkPercentage *
              SchoolInfo.standardPrecollegeGradingPercentageHomework) +
          (middleSchoolGrade *
              SchoolInfo.standardPrecollegeGradingPercentagePreviousSchool) +
          (finalExamScore *
              SchoolInfo.standardPrecollegeGradingPercentageFinalExam);

      //return final grade
      return grade.round();
    }

    //if there is no valid high school, return  0
    return 0;
  }
}
