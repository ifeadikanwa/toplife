import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_sum_count_of_food.dart';

void main() {
  group("GetSumCountOfFood:", () {
    test(
      "if given a list of fridge food items with 15 servings return 15",
      () {
        const fridgeFoodItems = [
          FridgeFood(
            id: 9,
            personId: 1,
            foodId: 1,
            servingsLeft: 4,
            expiryDay: 2,
          ),
          FridgeFood(
            id: 9,
            personId: 1,
            foodId: 1,
            servingsLeft: 0,
            expiryDay: 2,
          ),
          FridgeFood(
            id: 9,
            personId: 1,
            foodId: 1,
            servingsLeft: 2,
            expiryDay: 2,
          ),
          FridgeFood(
            id: 9,
            personId: 1,
            foodId: 1,
            servingsLeft: 6,
            expiryDay: 2,
          ),
          FridgeFood(
            id: 9,
            personId: 1,
            foodId: 1,
            servingsLeft: 3,
            expiryDay: 2,
          ),
        ];

        expect(getSumCountOfFood(fridgeFoodItems), 15);
      },
    );

    test(
      "if given a list of fridge food items with 0 servings return 0",
      () {
        const fridgeFoodItems = [
          FridgeFood(
            id: 9,
            personId: 1,
            foodId: 1,
            servingsLeft: 0,
            expiryDay: 2,
          ),
          FridgeFood(
            id: 9,
            personId: 1,
            foodId: 1,
            servingsLeft: 0,
            expiryDay: 2,
          ),
          FridgeFood(
            id: 9,
            personId: 1,
            foodId: 1,
            servingsLeft: 0,
            expiryDay: 2,
          ),
        ];

        expect(getSumCountOfFood(fridgeFoodItems), 0);
      },
    );

    test(
      "if given a list of fridge food items with negative servings return a sum that ignored the negative numbers",
      () {
        const fridgeFoodItems = [
          FridgeFood(
            id: 9,
            personId: 1,
            foodId: 1,
            servingsLeft: 4,
            expiryDay: 2,
          ),
          FridgeFood(
            id: 9,
            personId: 1,
            foodId: 1,
            servingsLeft: 0,
            expiryDay: 2,
          ),
          FridgeFood(
            id: 9,
            personId: 1,
            foodId: 1,
            servingsLeft: -5,
            expiryDay: 2,
          ),
          FridgeFood(
            id: 9,
            personId: 1,
            foodId: 1,
            servingsLeft: 6,
            expiryDay: 2,
          ),
          FridgeFood(
            id: 9,
            personId: 1,
            foodId: 1,
            servingsLeft: 7,
            expiryDay: 2,
          ),
        ];

        expect(getSumCountOfFood(fridgeFoodItems), 17);
      },
    );
  });
}
