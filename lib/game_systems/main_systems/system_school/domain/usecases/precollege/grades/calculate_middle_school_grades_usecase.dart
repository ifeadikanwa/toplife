import 'package:toplife/game_systems/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/model/info_models/precollege_info.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/grades/calculate_elementary_school_grades_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/manage/get_specific_precollege_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/util/get_precollege_attendance_percentage.dart';
import 'package:toplife/game_systems/main_systems/system_school/util/get_precollege_homework_percentage.dart';

class CalculateMiddleSchoolGradesUsecase {
  final GetSpecificPrecollegeSchoolUsecase _getSpecificPrecollegeSchoolUsecase;
  final CalculateElementarySchoolGradesUsecase
      _calculateElementarySchoolGradesUsecase;

  const CalculateMiddleSchoolGradesUsecase(
    this._getSpecificPrecollegeSchoolUsecase,
    this._calculateElementarySchoolGradesUsecase,
  );

  Future<int> execute({
    required int personID,
  }) async {
    //get the middle school precollege record
    final PrecollegeInfo? middleSchoolInfo =
        await _getSpecificPrecollegeSchoolUsecase.execute(
      personID: personID,
      precollegeSchoolType: SchoolType.middleSchool,
    );

    //if we have a valid record
    if (middleSchoolInfo != null) {
      //Do the calculations

      //middle school grades are determined by
      //-attendance
      //-homework
      //-elementary school grade
      //-final exam

      //attendance percentage
      final int attendancePercentage = getPrecollegeAttendancePercentage(
        attendanceDays: middleSchoolInfo.precollege.attendance,
        precollegeSchoolType: middleSchoolInfo.schoolType,
      );

      //homework percentage
      final int homeworkPercentage = getPrecollegeHomeworkPercentage(
        submittedHomework: middleSchoolInfo.precollege.homework,
        precollegeSchoolType: middleSchoolInfo.schoolType,
      );

      //elementary school grade
      final int elementarySchoolGrade =
          await _calculateElementarySchoolGradesUsecase.execute(
        personID: personID,
      );

      //final exam score
      final int finalExamScore = middleSchoolInfo.precollege.finalExam;

      //final grade
      //we convert the percentages to their grade percentage
      //that is how much of the final 100% does attendance decide, homework decide etc
      final double grade = (attendancePercentage *
              SchoolInfo.standardPrecollegeGradingPercentageAttendance) +
          (homeworkPercentage *
              SchoolInfo.standardPrecollegeGradingPercentageHomework) +
          (elementarySchoolGrade *
              SchoolInfo.standardPrecollegeGradingPercentagePreviousSchool) +
          (finalExamScore *
              SchoolInfo.standardPrecollegeGradingPercentageFinalExam);

      //return final grade
      return grade.round();
    }

    //if there is no valid middle school, return  0
    return 0;
  }
}
