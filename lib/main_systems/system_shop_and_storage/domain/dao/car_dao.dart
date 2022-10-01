import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';

abstract class CarDao {
  Future<Car> createCar(Car car);
  Future<Car?> getCar(int carID);
  Future<void> updateCar(Car car);
  Future<void> deleteCar(int carID);
  Future<List<Car>> getAllCars(int personID);
}
