import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/dao/jewelry_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/jewelry_repository.dart';

class JewelryRepositoryImpl implements JewelryRepository {
  final JewelryDao _jewelryDao;

  const JewelryRepositoryImpl({
    required JewelryDao jewelryDao,
  }) : _jewelryDao = jewelryDao;

  @override
  Future<Jewelry> createJewelry(Jewelry jewelry) {
    return _jewelryDao.createJewelry(jewelry);
  }

  @override
  Future<void> deleteJewelry(int jewelryID) {
    return _jewelryDao.deleteJewelry(jewelryID);
  }

  @override
  Future<List<Jewelry>> getAllJewelry(int personID) {
    return _jewelryDao.getAllJewelry(personID);
  }

  @override
  Future<Jewelry?> getJewelry(int jewelryID) {
    return _jewelryDao.getJewelry(jewelryID);
  }

  @override
  Future<void> updateJewelry(Jewelry jewelry) {
    return _jewelryDao.updateJewelry(jewelry);
  }

  @override
  Stream<List<Jewelry>> watchAllJewelry(int personID) {
    return _jewelryDao.watchAllJewelry(personID);
  }

  @override
  Stream<Jewelry?> watchJewelry(int jewelryID) {
    return _jewelryDao.watchJewelry(jewelryID);
  }
}
