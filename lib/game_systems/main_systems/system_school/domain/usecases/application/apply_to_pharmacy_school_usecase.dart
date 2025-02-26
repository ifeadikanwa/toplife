// import 'dart:math';

// ignore_for_file: unused_field

// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// import 'package:toplife/main_systems/system_school/constants/grade.dart';
// import 'package:toplife/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/game_systems/main_systems/system_school/data/repository/school_repositories.dart';
// import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';
// import 'package:toplife/main_systems/system_school/domain/model/info_models/school_application_response.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/get_highest_grade_for_any_completed_school_in_a_discipline_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/get_or_create_degree_usecase.dart';

class ApplyToPharmacySchoolUsecase {
  final SchoolRepositories _schoolRepositories;
  final GetOrCreateDegreeUsecase _getOrCreateDegreeUsecase;
  final GetHighestGradeForAnyCompletedSchoolInADisciplineUsecase
      _getHighestGradeForAnyCompletedSchoolInADiscipline;

  const ApplyToPharmacySchoolUsecase({
    required SchoolRepositories schoolRepositories,
    required GetOrCreateDegreeUsecase getOrCreateDegreeUsecase,
    required GetHighestGradeForAnyCompletedSchoolInADisciplineUsecase
        getHighestGradeForAnyCompletedSchoolInADisciplineUsecase,
  })  : _schoolRepositories = schoolRepositories,
        _getOrCreateDegreeUsecase = getOrCreateDegreeUsecase,
        _getHighestGradeForAnyCompletedSchoolInADiscipline =
            getHighestGradeForAnyCompletedSchoolInADisciplineUsecase;

// Future<SchoolApplicationResponse> execute({
//   required int mainPersonID,
//   required Degree degree,
//   required int gameEconomy,
// }) async {
//   //if the player already has a pharmacy degree,reject.
//
//   //To get a pharmacy degree you need at least a B in any science discipline
//
//   //get highest grade for completed degree
//
//   //if the grade is below the lower bound for B, reject
//   //else
//   //accept,
//   //if the grade is at least A give 80-100% scholarship
//
//   final Degree degreeRecord =
//       await _getOrCreateDegreeUsecase.execute(degree: degree);
//
//   List<School> completedPharmacySchool = await _schoolRepositories
//       .schoolRepositoryImpl
//       .getAllCompletedSchoolForADegree(mainPersonID, degreeRecord.id);
//
//   if (completedPharmacySchool.isNotEmpty) {
//     return SchoolApplicationResponse(
//       degreeID: degreeRecord.id,
//       accepted: false,
//       reason: "You have already earned this degree",
//     );
//   }
//
//   final int grade =
//       await _getHighestGradeForAnyCompletedSchoolInADiscipline.execute(
//     mainPersonID: mainPersonID,
//     degreeDiscipline: DegreeDiscipline.naturalScience,
//   );
//
//   if (grade < Grade.b.lowerBound) {
//     return SchoolApplicationResponse(
//       degreeID: degreeRecord.id,
//       accepted: false,
//       reason: "Your application was rejected. You need to have at least a B in any natural science degree.",
//     );
//   } else {
//     late final int scholarshipPercentage;
//
//     if (grade >= Grade.a.lowerBound) {
//       scholarshipPercentage = (Random().nextInt(3) + 8) * 10;
//     } else {
//       scholarshipPercentage = 0;
//     }
//
//     return SchoolApplicationResponse(
//       degreeID: degreeRecord.id,
//       accepted: true,
//       //amount = base cost * game economy + (1-5% of base cost for variability)
//       schoolFeesPerSemesterAmount:
//           SchoolInfo.pharmacySchoolDegreeBaseCost * gameEconomy +
//               (0.05 *
//                       Random().nextDouble() *
//                       SchoolInfo.pharmacySchoolDegreeBaseCost)
//                   .toInt(),
//       appliedForScholarship: false,
//       scholarshipPercentage: scholarshipPercentage,
//     );
//   }
// }
}
