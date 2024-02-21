// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// import 'package:toplife/main_systems/system_school/constants/degree_level.dart';
// ignore_for_file: unused_field

import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';

class GetHighestAttainedDegreeLevelForACompletedDegreeUsecase {
  final SchoolRepositories _schoolRepositories;

  const GetHighestAttainedDegreeLevelForACompletedDegreeUsecase(
      {required SchoolRepositories schoolRepositories})
      : _schoolRepositories = schoolRepositories;

// Future<DegreeLevel?> execute(int mainPersonID, int degreeID) async {
//   //get the degree info with the degree id,
//   //if it is a special degree return special
//   //we take a degree id and find completed school with that id
//   //else
//   //if the list is empty we return null
//   //else we check if it contains a doctorate
//   //else we check if it contains a master
//   //else we return bachelor
//
//   final Degree? degree =
//       await _schoolRepositories.degreeRepositoryImpl.getDegree(degreeID);
//
//   if (degree != null) {
//     //check if it is a special degree
//     if (degree.isSpecialDegree) {
//       return DegreeLevel.special;
//     }
//
//     //if it's not a special degree get the completed schools for that degree
//     List<School> completedSchools = await _schoolRepositories
//         .schoolRepositoryImpl
//         .getAllCompletedSchoolForADegree(mainPersonID, degreeID);
//
//     if (completedSchools.isNotEmpty) {
//       //if there is a doctorate degree return doctorate
//       if (completedSchools
//           .where((school) => school.degreeLevel == DegreeLevel.doctorate.name)
//           .isNotEmpty) {
//         return DegreeLevel.doctorate;
//       }
//       //if there is a master degree return master
//       else if (completedSchools
//           .where((school) => school.degreeLevel == DegreeLevel.master.name)
//           .isNotEmpty) {
//         return DegreeLevel.master;
//       }
//       //else we know it's just a bachelor's degree
//       else {
//         return DegreeLevel.bachelor;
//       }
//     }
//   }
//
//   //if we happen to get nothing from our search for degrees or completed school then we'll reach this point
//   return null;
// }
}
