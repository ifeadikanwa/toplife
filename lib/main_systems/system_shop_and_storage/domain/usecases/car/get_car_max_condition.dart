import 'package:toplife/main_systems/system_shop_and_storage/constants/car_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_quality_enum.dart';

class GetCarMaxConditionUsecase {
  const GetCarMaxConditionUsecase();

  int execute({
    required Car car,
    required int currentDay,
  }) {
    //calculate the max condition of a car
    //max condition = (max condition at purchase) - ((max depreciation value - fluctuator) * ((currentDay - day of purchase)/maxConditionDepreciationDaysLength) )

    final int daysPassed = currentDay - car.dayOfPurchase;

    final int numberOfDepreciationCycles =
        (daysPassed / CarConstants.maxConditionDepreciationDaysLength).floor();

    final CarQuality carQuality =
        getCarQualityEnum(car.quality) ?? CarQuality.low;

    final int maxCondition = car.maxConditionAtPurchase -
        ((carQuality.maxDepreciation - car.depreciationFluctuator) *
            numberOfDepreciationCycles);

    return maxCondition;
  }
}
