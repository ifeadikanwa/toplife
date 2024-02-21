// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// ignore_for_file: unused_field

import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';
// import 'package:toplife/main_systems/system_school/domain/model/info_models/school_pair.dart';

class GetSchoolPairsFromSchoolsUsecase {
  final SchoolRepositories _schoolRepositories;

  const GetSchoolPairsFromSchoolsUsecase({
    required SchoolRepositories schoolRepositories,
  }) : _schoolRepositories = schoolRepositories;

// Future<List<SchoolPair>> execute({required List<School> schools}) async {
//   List<SchoolPair> schoolPairs = [];
//
//   for (var school in schools) {
//     final Degree? degree =
//         await _schoolRepositories.degreeRepositoryImpl.getDegree(
//       school.degreeId,
//     );
//
//     if (degree != null) {
//       schoolPairs.add(SchoolPair(school: school, degree: degree));
//     }
//   }
//
//   return schoolPairs;
// }
}
