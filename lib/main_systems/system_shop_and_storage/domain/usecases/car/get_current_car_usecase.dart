import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/car_repository.dart';

class GetCurrentCarUsecase {
  final CarRepository _carRepository;

  const GetCurrentCarUsecase(this._carRepository);

  Future<Car?> execute({
    required int personID,
  }) async {
    return _carRepository.getCurrentCar(
      personID,
    );
  }
}
