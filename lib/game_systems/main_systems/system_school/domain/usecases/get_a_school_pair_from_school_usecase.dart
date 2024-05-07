// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// ignore_for_file: unused_field

import 'package:toplife/game_systems/main_systems/system_school/data/repository/school_repositories.dart';
// import 'package:toplife/main_systems/system_school/domain/model/info_models/school_pair.dart';

class GetASchoolPairFromSchoolUsecase {
  final SchoolRepositories _schoolRepositories;

  const GetASchoolPairFromSchoolUsecase({
    required SchoolRepositories schoolRepositories,
  }) : _schoolRepositories = schoolRepositories;

// Future<SchoolPair?> execute({required School school}) async {
//   final Degree? degree =
//       await _schoolRepositories.degreeRepositoryImpl.getDegree(
//     school.degreeId,
//   );
//
//   if (degree != null) {
//     return SchoolPair(school: school, degree: degree);
//   }
//
//   return null;
// }
}
