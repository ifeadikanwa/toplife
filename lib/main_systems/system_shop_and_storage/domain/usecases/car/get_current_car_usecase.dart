import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
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
