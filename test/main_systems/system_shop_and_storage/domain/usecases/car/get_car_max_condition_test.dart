import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/get_car_max_condition.dart';

void main() {
  group("get car max condition usecase:", () {
    const int currentDay = 54;

    const testCar = Car(
      name: "name",
      type: "type",
      percentageOfTravelTime: 80,
      quality: "quality",
      basePrice: 300,
      dayOfPurchase: 0,
      fuelTank: 100,
      problem: "problem",
      useCondition: 100,
      maxConditionAtPurchase: 100,
    );
    test(
      "given a high quality car purchased on day 20 with max condition 100, if the current day is 54, the max condition is now 67",
      () {
        final car = testCar.copyWith(
          quality: CarQuality.high.name,
          dayOfPurchase: 20,
          maxConditionAtPurchase: 100,
        );

        expect(
          const GetCarMaxConditionUsecase().execute(
            car: car,
            currentDay: currentDay,
          ),
          67,
        );
      },
    );

    test(
      "given a mid quality car purchased on day 20 with max condition 100, if the current day is 54, the max condition is now 58",
      () {
        final car = testCar.copyWith(
          quality: CarQuality.mid.name,
          dayOfPurchase: 20,
          maxConditionAtPurchase: 100,
        );

        expect(
          const GetCarMaxConditionUsecase().execute(
            car: car,
            currentDay: currentDay,
          ),
          58,
        );
      },
    );

    test(
      "given a low quality car purchased on day 20 with max condition 100, if the current day is 54, the max condition is now 40",
      () {
        final car = testCar.copyWith(
          quality: CarQuality.low.name,
          dayOfPurchase: 20,
          maxConditionAtPurchase: 100,
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
      "given a invalid quality car purchased on day 20 with max condition 100, if the current day is 54, the max condition is now 40 because low quality is used in calculations",
      () {
        final car = testCar.copyWith(
          quality: "wrong",
          dayOfPurchase: 20,
          maxConditionAtPurchase: 100,
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
  });
}
