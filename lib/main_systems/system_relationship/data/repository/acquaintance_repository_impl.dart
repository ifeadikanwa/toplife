import 'package:toplife/main_systems/system_relationship/domain/dao/acquaintance_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/acquaintance_repository.dart';

class AcquaintanceRepositoryImpl implements AcquaintanceRepository {
  final AcquaintanceDao _acquaintanceDao;

  const AcquaintanceRepositoryImpl({required AcquaintanceDao acquaintanceDao})
      : _acquaintanceDao = acquaintanceDao;

  @override
  Future<Acquaintance> createAcquaintance(Acquaintance acquaintance) async {
    return _acquaintanceDao.createAcquaintance(acquaintance);
  }

  @override
  Future<void> deleteAcquaintance(int mainPersonID, int acquaintanceID) async {
    return _acquaintanceDao.deleteAcquaintance(mainPersonID, acquaintanceID);
  }

  @override
  Future<Acquaintance?> getAcquaintance(
      int mainPersonID, int acquaintanceID) async {
    return _acquaintanceDao.getAcquaintance(mainPersonID, acquaintanceID);
  }

  @override
  Future<List<Acquaintance>> getAllAcquaintances(int mainPersonID) async {
    return _acquaintanceDao.getAllAcquaintance(mainPersonID);
  }

  @override
  Future<void> updateAcquaintance(Acquaintance acquaintance) async {
    return _acquaintanceDao.updateAcquaintance(acquaintance);
  }

  @override
  Stream<Acquaintance?> watchAcquaintance(
      int mainPersonID, int acquaintanceID) {
    return _acquaintanceDao.watchAcquaintance(mainPersonID, acquaintanceID);
  }

  @override
  Stream<List<Acquaintance>> watchAllAcquaintance(int mainPersonID) {
    return _acquaintanceDao.watchAllAcquaintance(mainPersonID);
  }
}
