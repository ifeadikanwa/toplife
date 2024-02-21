import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';

class GetOrCreateDegreeUsecase {
  final SchoolRepositories _schoolRepositories;

  const GetOrCreateDegreeUsecase({
    required SchoolRepositories schoolRepositories,
  }) : _schoolRepositories = schoolRepositories;

  Future<Degree> execute({required Degree degree}) async {
    final degreeRecord = await _schoolRepositories.degreeRepositoryImpl
        .findDegreeWithDegreeDisciplineAndBranch(
      degreeDiscipline: degree.discipline,
      degreeBranch: degree.branch,
    );

    if (degreeRecord != null) {
      return degreeRecord;
    } else {
      final Degree createdDegree =
          await _schoolRepositories.degreeRepositoryImpl.createDegree(degree);

      return createdDegree;
    }
  }
}
