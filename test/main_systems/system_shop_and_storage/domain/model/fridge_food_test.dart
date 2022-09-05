import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/fridge_food.dart';

void main() {
  late FridgeFood sut;

  setUp(() {
    sut = const FridgeFood(
      id: 2,
      personID: 4,
      foodID: 6,
      servingsLeft: 12,
      expiryDay: 56,
    );
  });
  group("FridgeFood:", () {
    test("toMap returns map equivalent of object", () {
      final Map<String, Object?> correctMap = {
        "_id": 2,
        "personID": 4,
        "foodID": 6,
        "servingsLeft": 12,
        "expiryDay": 56,
      };

      expect(sut.toMap(), correctMap);
    });

    test("fromMap returns fridge food object equivalent of map ", () {
      final Map<String, Object?> map = {
        "_id": 2,
        "personID": 4,
        "foodID": 6,
        "servingsLeft": 12,
        "expiryDay": 56,
      };

      final result = FridgeFood.fromMap(frigdeFoodMap: map);

      expect(result, sut);
    });

    test("copyWith creates new object with correct values", () {
      const correctFridgeFood = FridgeFood(
        id: 1,
        personID: 4,
        foodID: 6,
        servingsLeft: 12,
        expiryDay: 59,
      );

      final result = sut.copyWith(
        id: 1,
        expiryDay: 59,
      );
      expect(result, correctFridgeFood);
    });

    group("Constants:", () {
      test("id column should be defined as _id", () {
        expect(FridgeFood.idColumn, "_id");
      });
    });
  });
}
