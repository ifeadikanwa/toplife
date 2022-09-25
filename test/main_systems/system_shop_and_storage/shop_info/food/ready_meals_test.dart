import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/food_lifespan.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/food_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/food/ready_meals.dart';

void main() {
  group("Ready Meals:", () {
    test("ready meals list has at least 5 ready meals", () {
      expect(
        readyMeals.length,
        greaterThanOrEqualTo(5),
      );
    });

    test("ready meal name has at least 3 letters", () {
      for (var readyMeal in readyMeals) {
        expect(
          readyMeal.name.trim().length,
          greaterThanOrEqualTo(3),
          reason: "Cause: $readyMeal",
        );
      }
    });

    //*this is supposed to ensure that all items in the list have a price.
    //*But at this point the game economy has not been worked out so there are no prices
    //*The moment prices are added this should fail so you need to:
    //! change it to check that all base prices are greater than the least priced item.
    test("base price is 0", () {
      for (var readyMeal in readyMeals) {
        expect(
          readyMeal.basePrice,
          0,
          reason: "Cause: ${readyMeal.name}",
        );
      }
    });

    test("All ready meals have a type of 'readyMeal'", () {
      for (var readyMeal in readyMeals) {
        expect(
          readyMeal.type,
          FoodType.readyMeal.name,
          reason: "Cause: ${readyMeal.name}",
        );
      }
    });

    test("All ready meals have a short or mid lifespan", () {
      for (var readyMeal in readyMeals) {
        expect(
          readyMeal.lifespanInDays,
          isIn([
            FoodLifespan.short.days,
            FoodLifespan.mid.days,
          ]),
          reason: "Cause: ${readyMeal.name}",
        );
      }
    });

    test("All readyMeals are not organic", () {
      for (var readyMeal in readyMeals) {
        expect(
          readyMeal.isOrganic,
          false,
          reason: "Cause: ${readyMeal.name}",
        );
      }
    });

    test("nutrition is in the range 1 - 100", () {
      for (var readyMeal in readyMeals) {
        expect(
          readyMeal.nutrition,
          inInclusiveRange(1, 100),
          reason: "Cause: ${readyMeal.name}",
        );
      }
    });

    test("servings are in the range 1 - 10", () {
      for (var readyMeal in readyMeals) {
        expect(
          readyMeal.servings,
          inInclusiveRange(1, 10),
          reason: "Cause: ${readyMeal.name}",
        );
      }
    });
  });
}
