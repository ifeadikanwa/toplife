import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_completed_degrees_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_highest_attained_degree_level_for_a_completed_degree_usecase.dart';

class SchoolUsecases {
  final SchoolRepositories _schoolRepositories;

  const SchoolUsecases({required SchoolRepositories schoolRepositories})
      : _schoolRepositories = schoolRepositories;

  GetCompletedDegreesUsecase get getCompletedDegreesUsecase =>
      GetCompletedDegreesUsecase(schoolRepositories: _schoolRepositories);

  GetHighestAttainedDegreeLevelForACompletedDegreeUsecase
      get getHighestAttainedDegreeLevelForACompletedDegree =>
          GetHighestAttainedDegreeLevelForACompletedDegreeUsecase(
              schoolRepositories: _schoolRepositories);
}
