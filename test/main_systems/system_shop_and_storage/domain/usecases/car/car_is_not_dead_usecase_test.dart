import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/car_is_not_dead_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/get_car_max_condition.dart';

void main() {
  group("car is not dead usecase:", () {
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
      problem: "problem",
      useCondition: 100,
      maxConditionAtPurchase: 100,
      currentlyDriving: false,
      fullyPaidFor: true,
      isInsured: true,
      insuranceCost: 0,
      insuranceType: "",
    );

    const CarIsNotDeadUsecase carIsNotDeadUsecase = CarIsNotDeadUsecase(
      GetCarMaxConditionUsecase(),
    );
    test(
      "if max condition is less than or equal to 5 return false",
      () {
        //max condition is 5
        final car = testCar.copyWith(
          quality: CarQuality.low.name,
          dayOfPurchase: 20,
          maxConditionAtPurchase: 65,
        );

        expect(
          carIsNotDeadUsecase.execute(
            car: car,
            currentDay: currentDay,
          ),
          false,
          reason: "car 1",
        );

        //max condition is 2
        final car2 = testCar.copyWith(
          quality: CarQuality.low.name,
          dayOfPurchase: 20,
          maxConditionAtPurchase: 62,
        );

        expect(
          carIsNotDeadUsecase.execute(
            car: car2,
            currentDay: currentDay,
          ),
          false,
          reason: "car 2",
        );
      },
    );

    test(
      "if max condition is greater than 5 return true",
      () {
        //max condition is 5
        final car = testCar.copyWith(
          quality: CarQuality.low.name,
          dayOfPurchase: 20,
          maxConditionAtPurchase: 75,
        );

        expect(
          carIsNotDeadUsecase.execute(
            car: car,
            currentDay: currentDay,
          ),
          true,
          reason: "car 1",
        );

        //max condition is 2
        final car2 = testCar.copyWith(
          quality: CarQuality.low.name,
          dayOfPurchase: 20,
          maxConditionAtPurchase: 100,
        );

        expect(
          carIsNotDeadUsecase.execute(
            car: car2,
            currentDay: currentDay,
          ),
          true,
          reason: "car 2",
        );
      },
    );
  });
}
