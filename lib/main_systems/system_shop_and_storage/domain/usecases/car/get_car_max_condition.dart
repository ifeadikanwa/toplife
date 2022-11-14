import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_quality.dart';

class GetCarMaxConditionUsecase {
  const GetCarMaxConditionUsecase();

  int execute({
    required Car car,
    required int currentDay,
  }) {
    //calculate the max condition of a car
    //max condition = (max condition at purchase) - (max depreciation value * ((currentDay - day of purchase)/maxConditionDepreciationDaysLength) )

    final int daysPassed = currentDay - car.dayOfPurchase;

    final int numberOfDepreciationCycles =
        (daysPassed / Car.maxConditionDepreciationDaysLength).floor();

    final CarQuality carQuality = getCarQuality(car.quality) ?? CarQuality.low;

    final int maxCondition = car.maxConditionAtPurchase -
        (carQuality.maxDepreciation * numberOfDepreciationCycles);

    return maxCondition;
  }
}
