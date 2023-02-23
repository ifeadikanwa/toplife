import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/get_car_max_condition.dart';

class CarIsNotDeadUsecase {
  final GetCarMaxConditionUsecase _getCarMaxConditionUsecase;
  const CarIsNotDeadUsecase(this._getCarMaxConditionUsecase);

  bool execute({
    required Car car,
    required int currentDay,
  }) {
    
    //as long as max condition is not less than or equal to five the car is not completely unuseable/dead.

    final int maxCondition = _getCarMaxConditionUsecase.execute(
      car: car,
      currentDay: currentDay,
    );

    return !(maxCondition <= 5);
  }
}
