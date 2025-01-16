import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/food_lifespan.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/food_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/food/cooked_meals.dart';

void main() {
  group("Cooked Meals:", () {
    test("Cooked meals list contains at least 5 meals", () {
      expect(cookedMeals.length, greaterThanOrEqualTo(5));
    });

    test(
      "All cooked meals have names with a length greater than or equal to 3",
      () {
        for (var cookedMeal in cookedMeals) {
          expect(
            cookedMeal.food.name.trim().length,
            greaterThanOrEqualTo(3),
            reason: "Cause: ${cookedMeal.food}",
          );
        }
      },
    );

    test("base price is 0", () {
      for (var cookedMeal in cookedMeals) {
        expect(
          cookedMeal.food.basePrice,
          0,
          reason: "Cause: ${cookedMeal.food.name}",
        );
      }
    });

    test("All cooked meals have a long lifespan", () {
      for (var cookedMeal in cookedMeals) {
        expect(
          cookedMeal.food.lifespanInDays,
          FoodLifespan.long.days,
          reason: "Cause: ${cookedMeal.food.name}",
        );
      }
    });

    test("All cooked meals need at least 2 ingredients", () {
      for (var cookedMeal in cookedMeals) {
        expect(
          cookedMeal.ingredients.length,
          greaterThanOrEqualTo(2),
          reason: "Cause: ${cookedMeal.food.name}",
        );
      }
    });

    test("All cooked meals have an nutrition within the range 15 - 100", () {
      for (var cookedMeal in cookedMeals) {
        expect(
            cookedMeal.food.nutrition,
            inInclusiveRange(15, 100),
            reason: "Cause: ${cookedMeal.food.name}");
      }
    });

    test("All cooked meals are organic", () {
      for (var cookedMeal in cookedMeals) {
        expect(
          cookedMeal.food.isOrganic,
          true,
          reason: "Cause: ${cookedMeal.food.name}",
        );
      }
    });

    test("All cooked meals are ready meals", () {
      for (var cookedMeal in cookedMeals) {
        expect(
          cookedMeal.food.type,
          FoodType.readyMeal.name,
          reason: "Cause: ${cookedMeal.food.name}",
        );
      }
    });

    test("All cooked meals servings are within the range 1 - 10", () {
      for (var cookedMeal in cookedMeals) {
        expect(
          cookedMeal.food.servings,
          inInclusiveRange(1, 10),
          reason: "Cause: ${cookedMeal.food.name}",
        );
      }
    });
  });
}
