import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/dao/current_home_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/current_home_repository.dart';

class CurrentHomeRepositoryImpl implements CurrentHomeRepository {
  final CurrentHomeDao _currentHomeDao;

  const CurrentHomeRepositoryImpl({
    required CurrentHomeDao currentHomeDao,
  }) : _currentHomeDao = currentHomeDao;

  @override
  Future<CurrentHome> createCurrentHome(CurrentHome currentHome) {
    return _currentHomeDao.createCurrentHome(currentHome);
  }

  @override
  Future<void> deleteCurrentHome(int personID) {
    return _currentHomeDao.deleteCurrentHome(personID);
  }

  @override
  Future<List<CurrentHome>> getAllPeopleInAHouse(int houseID) {
    return _currentHomeDao.getAllPeopleInAHouse(houseID);
  }

  @override
  Future<CurrentHome?> getCurrentHome(int personID) {
    return _currentHomeDao.getCurrentHome(personID);
  }

  @override
  Future<void> updateCurrentHome(CurrentHome currentHome) {
    return _currentHomeDao.updateCurrentHome(currentHome);
  }

  @override
  Stream<List<CurrentHome>> watchAllPeopleInAHouse(int houseID) {
    return _currentHomeDao.watchAllPeopleInAHouse(houseID);
  }

  @override
  Stream<CurrentHome?> watchCurrentHome(int personID) {
    return _currentHomeDao.watchCurrentHome(personID);
  }
}
