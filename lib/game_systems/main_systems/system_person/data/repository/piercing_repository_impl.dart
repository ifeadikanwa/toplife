import 'package:toplife/game_systems/main_systems/system_person/domain/dao/piercing_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/piercing_repository.dart';

class PiercingRepositoryImpl implements PiercingRepository {
  final PiercingDao _piercingDao;

  const PiercingRepositoryImpl({required PiercingDao piercingDao})
      : _piercingDao = piercingDao;

  @override
  Future<Piercing> createPiercing(Piercing piercing) async {
    return _piercingDao.createPiercing(piercing);
  }

  @override
  Future<void> deletePiercing(int piercingID) async {
    return _piercingDao.deletePiercing(piercingID);
  }

  @override
  Future<Piercing?> getPiercing(int piercingID) async {
    return _piercingDao.getPiercing(piercingID);
  }

  @override
  Future<void> updatePiercing(Piercing piercing) async {
    return _piercingDao.updatePiercing(piercing);
  }

  @override
  Future<List<Piercing>> getAllPiercings(int personID) {
    return _piercingDao.getAllPiercings(personID);
  }
}
