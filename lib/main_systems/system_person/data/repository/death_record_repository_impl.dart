import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/dao/death_record_dao.dart';
import 'package:toplife/main_systems/system_person/domain/repository/death_record_repository.dart';

class DeathRecordRepositoryImpl implements DeathRecordRepository {
  final DeathRecordDao _deathRecordDao;

  const DeathRecordRepositoryImpl({
    required DeathRecordDao deathRecordDao,
  }) : _deathRecordDao = deathRecordDao;

  @override
  Future<DeathRecord> createOrUpdateDeathRecord(DeathRecord deathRecord) async {
    return _deathRecordDao.createOrUpdateDeathRecord(deathRecord);
  }

  @override
  Future<void> deleteDeathRecord(int gameID, int personID) async {
    return _deathRecordDao.deleteDeathRecord(gameID, personID);
  }

  @override
  Future<DeathRecord?> getDeathRecord(int gameID, int personID) async {
    return _deathRecordDao.getDeathRecord(gameID, personID);
  }
}
