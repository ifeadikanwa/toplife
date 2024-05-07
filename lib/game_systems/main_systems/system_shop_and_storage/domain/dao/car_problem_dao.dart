import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class CarProblemDao {
  Future<CarProblem> createCarProblem(CarProblem carProblem);
  Future<CarProblem?> getCarProblem(int carID, String type);
  Future<void> updateCarProblem(CarProblem carProblem);
  Future<void> deleteCarProblem(int carID, String type);
  Future<List<CarProblem>> getAllOfACarsProblems(int carID);
}
