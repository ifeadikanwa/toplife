// import 'dart:math';

// ignore_for_file: unused_field

// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// import 'package:toplife/main_systems/system_school/constants/degree_level.dart';
// import 'package:toplife/main_systems/system_school/constants/grade.dart';
// import 'package:toplife/main_systems/system_school/constants/school_info.dart';
// import 'package:toplife/main_systems/system_school/domain/model/info_models/school_application_response.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_completed_degrees_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_grade_for_completed_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_or_create_degree_usecase.dart';

class ApplyToTeacherEducationProgramUsecase {
  final GetOrCreateDegreeUsecase _getOrCreateDegreeUsecase;
  final GetCompletedDegreesUsecase _getCompletedDegreeUsecase;
  final GetGradeForCompletedSchoolUsecase _getGradeForCompletedSchoolUsecase;

  const ApplyToTeacherEducationProgramUsecase({
    required GetOrCreateDegreeUsecase getOrCreateDegreeUsecase,
    required GetCompletedDegreesUsecase getCompletedDegreesUsecase,
    required GetGradeForCompletedSchoolUsecase
        getGradeForCompletedSchoolUsecase,
  })  : _getOrCreateDegreeUsecase = getOrCreateDegreeUsecase,
        _getCompletedDegreeUsecase = getCompletedDegreesUsecase,
        _getGradeForCompletedSchoolUsecase = getGradeForCompletedSchoolUsecase;

// Future<SchoolApplicationResponse> execute({
//   required int mainPersonID,
//   required Degree degree,
//   required int gameEconomy,
// }) async {
//   //I want to be able to show a list of possible education degrees to the user.
//   //this means that checking if they qualified for the chosen degree will be handled here
//
//   //get a list of completed degrees
//
//   //check if the degree you are asking for is in that list
//   //if it is reject
//   //if it isnt we check if you have a non special degree branch that matches the branch of education you want to study
//   //if you don't we reject
//   //if you do we:
//   //
//   //get your grade
//   //we check if your grade is at least a B
//   //if it isnt reject
//   // if it is, use it to decide scholarship amount
//   //accept
//
//   final Degree degreeRecord =
//       await _getOrCreateDegreeUsecase.execute(degree: degree);
//
//   List<Degree> completedDegrees =
//       await _getCompletedDegreeUsecase.execute(personID: mainPersonID);
//
//   if (completedDegrees
//       .where((completedDegree) =>
//           completedDegree.discipline == degree.discipline &&
//           completedDegree.branch == degree.branch)
//       .isNotEmpty) {
//     return SchoolApplicationResponse(
//       degreeID: degreeRecord.id,
//       accepted: false,
//       reason: "You have already earned this degree",
//     );
//   }
//
//   final List<Degree> bachelorEquivalentForEducationDegreeList =
//       completedDegrees
//           .where((completedDegree) =>
//               completedDegree.branch == degree.branch &&
//               completedDegree.isSpecialDegree == false)
//           .toList();
//
//   if (bachelorEquivalentForEducationDegreeList.isEmpty) {
//     return SchoolApplicationResponse(
//       degreeID: degreeRecord.id,
//       accepted: false,
//       reason:
//           "You need to have at least a bachelor's degree in ${degree.branch} to enroll in this program",
//     );
//   }
//
//   final bachelorsDegree = bachelorEquivalentForEducationDegreeList[0];
//
//   final int grade = await _getGradeForCompletedSchoolUsecase.execute(
//     mainPersonID,
//     bachelorsDegree.id,
//     DegreeLevel.bachelor,
//   );
//
//   if (grade < Grade.b.lowerBound) {
//     return SchoolApplicationResponse(
//       degreeID: degreeRecord.id,
//       accepted: false,
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
//           SchoolInfo.teacherSchoolDegreeBaseCost * gameEconomy +
//               (0.05 *
//                       Random().nextDouble() *
//                       SchoolInfo.teacherSchoolDegreeBaseCost)
//                   .toInt(),
//       appliedForScholarship: false,
//       scholarshipPercentage: scholarshipPercentage,
//     );
//   }
// }
}
