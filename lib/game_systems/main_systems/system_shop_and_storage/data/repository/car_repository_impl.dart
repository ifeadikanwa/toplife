import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/dao/car_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final CarDao _carDao;

  const CarRepositoryImpl({
    required CarDao carDao,
  }) : _carDao = carDao;

  @override
  Future<Car> createCar(Car car) {
    return _carDao.createCar(car);
  }

  @override
  Future<void> deleteCar(int carID) {
    return _carDao.deleteCar(carID);
  }

  @override
  Future<List<Car>> getAllCars(int personID) {
    return _carDao.getAllCars(personID);
  }

  @override
  Future<Car?> getCar(int carID) {
    return _carDao.getCar(carID);
  }

  @override
  Future<void> updateCar(Car car) {
    return _carDao.updateCar(car);
  }

  @override
  Future<Car?> getCurrentCar(int personID) {
    return _carDao.getCurrentCar(personID);
  }

  @override
  Future<List<Car>> getAllCurrentlyDrivingCars(int personID) {
    return _carDao.getAllCurrentlyDrivingCars(personID);
  }

  @override
  Stream<List<Car>> watchAllCars(int personID) {
    return _carDao.watchAllCars(personID);
  }

  @override
  Stream<Car?> watchCar(int carID) {
    return _carDao.watchCar(carID);
  }
}
