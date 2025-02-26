import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/dao/degree_dao.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/repository/degree_repository.dart';

class DegreeRepositoryImpl implements DegreeRepository {
  final DegreeDao _degreeDao;

  const DegreeRepositoryImpl({required DegreeDao degreeDao})
      : _degreeDao = degreeDao;

  @override
  Future<Degree> createDegree(Degree degree) async {
    return _degreeDao.createDegree(degree);
  }

  @override
  Future<Degree?> getDegree(int degreeID) async {
    return _degreeDao.getDegree(degreeID);
  }

  @override
  Future<void> updateDegree(Degree degree) async {
    return _degreeDao.updateDegree(degree);
  }

  @override
  Future<Degree?> findDegreeWithDegreeDisciplineAndBranch({
    required String degreeDiscipline,
    required String degreeBranch,
  }) async {
    return _degreeDao.findDegreeWithDegreeDisciplineAndBranch(
        degreeDiscipline: degreeDiscipline, degreeBranch: degreeBranch);
  }
}
