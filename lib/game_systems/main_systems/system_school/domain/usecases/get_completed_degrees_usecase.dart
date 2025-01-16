// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// ignore_for_file: unused_field

import 'package:toplife/game_systems/main_systems/system_school/data/repository/school_repositories.dart';

class GetCompletedDegreesUsecase {
  final SchoolRepositories _schoolRepositories;

  const GetCompletedDegreesUsecase(
      {required SchoolRepositories schoolRepositories})
      : _schoolRepositories = schoolRepositories;

// Future<List<Degree>> execute({required int personID}) async {
//   //get the persons completed school
//   //put the degree ids in a set
//   //get the degree info fo all the degrees in the set
//
//   List<Degree> completedDegrees = [];
//
//   List<School> completedSchool = await _schoolRepositories
//       .schoolRepositoryImpl
//       .getAllCompletedSchool(personID);
//
//   if (completedSchool.isNotEmpty) {
//     Set<int> degreeIDs = {};
//
//     for (School school in completedSchool) {
//       degreeIDs.add(school.degreeId);
//     }
//
//     for (int degreeID in degreeIDs) {
//       Degree? degree =
//           await _schoolRepositories.degreeRepositoryImpl.getDegree(degreeID);
//       if (degree != null) {
//         completedDegrees.add(degree);
//       }
//     }
//   }
//
//   return completedDegrees;
// }
}
