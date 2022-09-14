import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';

void main() {
  late Car sut;

  setUp(() {
    sut = const Car(
      id: 2,
      personID: 4,
      name: "name",
      type: "type",
      percentageOfTravelTime: 50,
      quality: "quality",
      basePrice: 100,
      dayOfPurchase: 1,
      fuelTank: 60,
      problem: "noProblem",
      useCondition: 80,
      maxConditionAtPurchase: 100,
      fullyPaidFor: false,
    );
  });
  group("Car:", () {
    test("toMap returns map equivalent of object", () {
      final Map<String, Object?> correctMap = {
        "_id": 2,
        "personID": 4,
        "name": "name",
        "type": "type",
        "percentageOfTravelTime": 50,
        "quality": "quality",
        "basePrice": 100,
        "dayOfPurchase": 1,
        "fuelTank": 60,
        "problem": "noProblem",
        "useCondition": 80,
        "maxConditionAtPurchase": 100,
        "fullyPaidFor": 0
      };

      expect(sut.toMap(), correctMap);
    });

    test("fromMap returns car object equivalent of map ", () {
      final Map<String, Object?> map = {
        "_id": 2,
        "personID": 4,
        "name": "name",
        "type": "type",
        "percentageOfTravelTime": 50,
        "quality": "quality",
        "basePrice": 100,
        "dayOfPurchase": 1,
        "fuelTank": 60,
        "problem": "noProblem",
        "useCondition": 80,
        "maxConditionAtPurchase": 100,
        "fullyPaidFor": 0
      };

      final result = Car.fromMap(carMap: map);

      expect(result, sut);
    });

    test("copyWith creates new object with correct values", () {
      const correctCar = Car(
        id: 1,
        personID: 4,
        name: "name",
        type: "type",
        percentageOfTravelTime: 50,
        quality: "quality",
        basePrice: 100,
        dayOfPurchase: 1,
        fuelTank: 100,
        problem: "noProblem",
        useCondition: 80,
        maxConditionAtPurchase: 100,
        fullyPaidFor: true,
      );

      final result = sut.copyWith(
        id: 1,
        fullyPaidFor: true,
        fuelTank: 250
      );
      expect(result, correctCar);
    });

    group("Constants:", () {
      test("id column should be defined as _id", () {
        expect(Car.idColumn, "_id");
      });
    });
  });
}
