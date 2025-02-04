import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class CarDao {
  Future<Car> createCar(Car car);
  Future<Car?> getCar(int carID);
  Future<Car?> getCurrentCar(int personID);
  Future<void> updateCar(Car car);
  Future<void> deleteCar(int carID);
  Future<List<Car>> getAllCars(int personID);
  Future<List<Car>> getAllCurrentlyDrivingCars(int personID);
  Stream<Car?> watchCar(int carID);
  Stream<List<Car>> watchAllCars(int personID);
}
