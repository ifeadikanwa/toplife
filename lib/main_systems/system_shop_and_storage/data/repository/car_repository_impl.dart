import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/car_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/car_repository.dart';

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
}
