import 'package:toplife/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/precollege_info.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/manage/get_specific_precollege_school_usecase.dart';
import 'package:toplife/main_systems/system_school/util/get_precollege_attendance_percentage.dart';
import 'package:toplife/main_systems/system_school/util/get_precollege_homework_percentage.dart';

class CalculateElementarySchoolGradesUsecase {
  final GetSpecificPrecollegeSchoolUsecase _getSpecificPrecollegeSchoolUsecase;

  const CalculateElementarySchoolGradesUsecase(
      this._getSpecificPrecollegeSchoolUsecase);

  Future<int> execute({
    required int personID,
  }) async {
    //get the elementary school precollege record
    final PrecollegeInfo? elementarySchoolInfo =
        await _getSpecificPrecollegeSchoolUsecase.execute(
      personID: personID,
      precollegeSchoolType: SchoolType.elementarySchool,
    );

    //if we have a valid record
    if (elementarySchoolInfo != null) {
      //Do the calculations

      //elementary school grades are determined by
      //-attendance
      //-homework

      //attendance percentage
      final int attendancePercentage = getPrecollegeAttendancePercentage(
        attendanceDays: elementarySchoolInfo.precollege.attendance,
        precollegeSchoolType: elementarySchoolInfo.schoolType,
      );

      //homework percentage
      final int homeworkPercentage = getPrecollegeHomeworkPercentage(
        submittedHomework: elementarySchoolInfo.precollege.homework,
        precollegeSchoolType: elementarySchoolInfo.schoolType,
      );

      //final grade
      //we convert the percentages to their grade percentage
      //that is how much of the final 100% does attendance decide, and homework decide
      final double grade = (attendancePercentage *
              SchoolInfo.elementarySchoolGradingPercentageAttendance) +
          (homeworkPercentage *
              SchoolInfo.elementarySchoolGradingPercentageHomework);

      //return final grade
      return grade.round();
    }

    //if there is no valid elementary school, return  0
    return 0;
  }
}
