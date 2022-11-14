import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/car_repository.dart';

class UpdateCarUsecase {
  final CarRepository _carRepository;

  const UpdateCarUsecase(this._carRepository);

  Future<void> execute({
    required Car car,
  }) async {
    return _carRepository.updateCar(car);
  }
}
