// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// ignore_for_file: unused_field

import 'package:toplife/game_systems/main_systems/system_school/data/repository/school_repositories.dart';

class GetValidListOfMasterDegreesUsecase {
  final SchoolRepositories _schoolRepositories;

  const GetValidListOfMasterDegreesUsecase(
      {required SchoolRepositories schoolRepositories})
      : _schoolRepositories = schoolRepositories;

// Future<List<Degree>> execute({required int personID}) async {
//   //The aim is to provide a list of completed bachelor's degree that you can now get a masters for,
//   //but we make sure to remove any bachelor's degree you already have a completed master's degree for from that list.
//
//   //get users completed bachelor school
//   //get their completed master school
//   //for every master's school remove it's equivalent bachelor school from the list
//   //get the degree info of all the remaining bachelor schools degree
//
//   List<School> availableMasterSchools = await _schoolRepositories
//       .schoolRepositoryImpl
//       .getAllCompletedUndergraduateSchool(personID);
//
//   List<School> completedMasterSchools = await _schoolRepositories
//       .schoolRepositoryImpl
//       .getAllCompletedGraduateSchool(personID);
//
//   for (var completedMasterSchool in completedMasterSchools) {
//     availableMasterSchools.removeWhere(
//         (school) => school.degreeId == completedMasterSchool.degreeId);
//   }
//
//   List<Degree> availableMasterDegrees = [];
//
//   for (var availableMasterSchool in availableMasterSchools) {
//     Degree? degree = await _schoolRepositories.degreeRepositoryImpl
//         .getDegree(availableMasterSchool.degreeId);
//
//     if (degree != null) {
//       availableMasterDegrees.add(degree);
//     }
//   }
//
//   return availableMasterDegrees;
// }
}
