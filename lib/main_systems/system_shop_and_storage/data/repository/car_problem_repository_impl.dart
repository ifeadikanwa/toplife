import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/car_problem_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/car_problem_repository.dart';

class CarProblemRepositoryImpl implements CarProblemRepository {
  final CarProblemDao _carProblemDao;

  const CarProblemRepositoryImpl({
    required CarProblemDao carProblemDao,
  }) : _carProblemDao = carProblemDao;

  @override
  Future<CarProblem> createCarProblem(CarProblem carProblem) {
    return _carProblemDao.createCarProblem(carProblem);
  }

  @override
  Future<void> deleteCarProblem(int carID, String type) {
    return _carProblemDao.deleteCarProblem(carID, type);
  }

  @override
  Future<List<CarProblem>> getAllOfACarsProblems(int carID) {
    return _carProblemDao.getAllOfACarsProblems(carID);
  }

  @override
  Future<CarProblem?> getCarProblem(int carID, String type) {
    return _carProblemDao.getCarProblem(carID, type);
  }

  @override
  Future<void> updateCarProblem(CarProblem carProblem) {
    return _carProblemDao.updateCarProblem(carProblem);
  }
}
