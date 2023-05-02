import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/dao/deplete_stats_flag_dao.dart';
import 'package:toplife/main_systems/system_person/domain/repository/deplete_stats_flag_repository.dart';

class DepleteStatsFlagRepositoryImpl implements DepleteStatsFlagRepository {
  final DepleteStatsFlagDao _depleteStatsFlagDao;

  const DepleteStatsFlagRepositoryImpl({
    required DepleteStatsFlagDao depleteStatsFlagDao,
  }) : _depleteStatsFlagDao = depleteStatsFlagDao;

  @override
  Future<DepleteStatsFlag> createOrUpdateDepleteStatsFlag(
      DepleteStatsFlag depleteStatsFlag) async {
    return _depleteStatsFlagDao.createOrUpdateDepleteStatsFlag(depleteStatsFlag);
  }

  @override
  Future<void> deleteDepleteStatsFlag(int personID) async {
    return _depleteStatsFlagDao.deleteDepleteStatsFlag(personID);
  }

  @override
  Future<DepleteStatsFlag?> getDepleteStatsFlag(int personID) async {
    return _depleteStatsFlagDao.getDepleteStatsFlag(personID);
  }
}
