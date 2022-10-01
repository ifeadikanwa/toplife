import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/house_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/house_repository.dart';

class HouseRepositoryImpl implements HouseRepository {
  final HouseDao _houseDao;

  const HouseRepositoryImpl({
    required HouseDao houseDao,
  }) : _houseDao = houseDao;

  @override
  Future<House> createHouse(House house) {
    return _houseDao.createHouse(house);
  }

  @override
  Future<void> deleteHouse(int houseID) {
    return _houseDao.deleteHouse(houseID);
  }

  @override
  Future<List<House>> getAllHouses(int personID) {
    return _houseDao.getAllHouses(personID);
  }

  @override
  Future<House?> getHouse(int houseID) {
    return _houseDao.getHouse(houseID);
  }

  @override
  Future<void> updateHouse(House house) {
    return _houseDao.updateHouse(house);
  }
}
