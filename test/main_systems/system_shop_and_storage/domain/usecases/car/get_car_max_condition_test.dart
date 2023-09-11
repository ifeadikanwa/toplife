import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/get_car_max_condition.dart';

void main() {
  group("get car max condition usecase:", () {
    const int currentDay = 54;

    const testCar = Car(
      id: 0,
      personId: 3,
      name: "name",
      type: "type",
      percentageOfTravelTime: 80,
      quality: "quality",
      basePrice: 300,
      dayOfPurchase: 0,
      fuelTank: 100,
      maxConditionAtPurchase: 100,
      lastKnownCondition: 0,
      lastMaintenanceDay: 0,
      depreciationFluctuator: 0,
      currentlyDriving: false,
      fullyPaidFor: true,
      isInsured: true,
      insuranceCost: 0,
      insuranceType: "",
    );
    test(
      "given a high quality car and depreciation fluctuator 4, purchased on day 20 with max condition 100, if the current day is 54, the max condition is now 79",
      () {
        final car = testCar.copyWith(
          quality: CarQuality.high.name,
          dayOfPurchase: 20,
          maxConditionAtPurchase: 100,
          depreciationFluctuator: 4
        );

        expect(
          const GetCarMaxConditionUsecase().execute(
            car: car,
            currentDay: currentDay,
          ),
          79,
        );
      },
    );

    test(
      "given a mid quality car and depreciation fluctuator 1, purchased on day 20 with max condition 100, if the current day is 54, the max condition is now 61",
      () {
        final car = testCar.copyWith(
          quality: CarQuality.mid.name,
          dayOfPurchase: 20,
          maxConditionAtPurchase: 100,
          depreciationFluctuator: 1,
        );

        expect(
          const GetCarMaxConditionUsecase().execute(
            car: car,
            currentDay: currentDay,
          ),
          61,
        );
      },
    );

    test(
      "given a low quality car and depreciation fluctuator 0, purchased on day 20 with max condition 100, if the current day is 54, the max condition is now 40",
      () {
        final car = testCar.copyWith(
          quality: CarQuality.low.name,
          dayOfPurchase: 20,
          maxConditionAtPurchase: 100,
          depreciationFluctuator: 0
        );

        expect(
          const GetCarMaxConditionUsecase().execute(
            car: car,
            currentDay: currentDay,
          ),
          40,
        );
      },
    );

    test(
      "given a invalid quality car and depreciation fluctuator 4, purchased on day 20 with max condition 100, if the current day is 54, the max condition is now 52 because low quality is used in calculations",
      () {
        final car = testCar.copyWith(
          quality: "wrong",
          dayOfPurchase: 20,
          maxConditionAtPurchase: 100,
          depreciationFluctuator: 4
        );

        expect(
          const GetCarMaxConditionUsecase().execute(
            car: car,
            currentDay: currentDay,
          ),
          52,
        );
      },
    );
  });
}
