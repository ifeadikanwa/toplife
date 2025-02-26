// import 'package:toplife/core/data_source/database_constants.dart';
// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// import 'package:toplife/core/utils/day_of_week/get_next_week_day.dart';
// import 'package:toplife/main_systems/system_school/constants/degree_level.dart';
// import 'package:toplife/main_systems/system_school/constants/school_info.dart';
// import 'package:toplife/main_systems/system_school/constants/school_type.dart';
// ignore_for_file: unused_field

import 'package:toplife/game_systems/main_systems/system_school/data/repository/school_repositories.dart';
// import 'package:toplife/main_systems/system_school/domain/model/info_models/school_application_response.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/end_all_active_school_programs_usecase.dart';
// import 'package:toplife/main_systems/system_school/util/get_random_class_start_time.dart';
// import 'package:toplife/main_systems/system_school/util/get_random_school_name.dart';

class AdmitIntoUndergraduateSchoolUsecase {
  final SchoolRepositories _schoolRepositories;
  final EndAllActiveSchoolProgramsUsecase _endAllActiveSchoolProgramsUsecase;

  const AdmitIntoUndergraduateSchoolUsecase({
    required SchoolRepositories schoolRepositories,
    required EndAllActiveSchoolProgramsUsecase
        endAllActiveSchoolProgramsUsecase,
  })  : _schoolRepositories = schoolRepositories,
        _endAllActiveSchoolProgramsUsecase = endAllActiveSchoolProgramsUsecase;

// Future<School> execute(
//   int mainPersonID,
//   SchoolApplicationResponse schoolApplicationResponse,
//   int currentDay,
// ) async {
//   //we make sure to end any active school program
//   //we get the person's country
//   //we create an undegraduate school record and store it in the database
//
//   await _endAllActiveSchoolProgramsUsecase.execute(
//     mainPersonID: mainPersonID,
//   );
//
//   int classStartTime = getRandomClassStartTime();
//   int classEndTime =
//       classStartTime + SchoolInfo.defaultclassDurationInMinutes;
//
//   final School undergraduateSchool = School(
//     id: DatabaseConstants.dummyId,
//     mainPersonId: mainPersonID,
//     name: "${getRandomSchoolName()} ${SchoolType.undergraduateSchool.schoolNameSuffix}",
//     grades: SchoolInfo.newSemesterGradeReset,
//     attendance: SchoolInfo.newSemesterGradeReset,
//     project: SchoolInfo.newSemesterGradeReset,
//     exam: SchoolInfo.newSemesterGradeReset,
//     classStartTime: classStartTime,
//     classEndTime: classEndTime,
//     totalSemesterNumber: SchoolInfo.undergraduateTotalSemesters,
//     currentSemesterNumber: SchoolInfo.firstSemester,
//     schoolType: SchoolType.undergraduateSchool.name,
//     currentDayInSemester: SchoolInfo.semesterNotStarted,
//     semesterStartDay: getNextWeekDay(currentDay, 0),
//     degreeId: schoolApplicationResponse.degreeID,
//     degreeLevel: DegreeLevel.bachelor.name,
//     schoolFeesPerSemester:
//         schoolApplicationResponse.schoolFeesPerSemesterAmount,
//     scholarshipPercentage: schoolApplicationResponse.appliedForScholarship
//         ? schoolApplicationResponse.scholarshipPercentage
//         : SchoolInfo.noScholarship,
//     hasTakenLeave: false,
//     isActive: true, totalLoanAmount: 0,
//     loanProcessed: true,
//     isCompleted: false,
//     wasExpelled: false,
//   );
//
//   final createdSchool = await _schoolRepositories.schoolRepositoryImpl
//       .createSchool(undergraduateSchool);
//
//   return createdSchool;
// }
}
