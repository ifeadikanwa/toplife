import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/car_repository.dart';

class SetAllPersonCarsToNotCurrentlyDrivingUsecase {
  final CarRepository _carRepository;

  const SetAllPersonCarsToNotCurrentlyDrivingUsecase(this._carRepository);

  Future<void> execute({
    required int personID,
  }) async {
    final List<Car> allCurrentlyDrivingCars =
        await _carRepository.getAllCurrentlyDrivingCars(
      personID,
    );

    for (var car in allCurrentlyDrivingCars) {
      await _carRepository.updateCar(
        car.copyWith(
          currentlyDriving: false,
        ),
      );
    }
  }
}
