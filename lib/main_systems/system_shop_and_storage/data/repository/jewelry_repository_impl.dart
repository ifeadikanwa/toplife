import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/jewelry_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/jewelry.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/jewelry_repository.dart';

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
}
