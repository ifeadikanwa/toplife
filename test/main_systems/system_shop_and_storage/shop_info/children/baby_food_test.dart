import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/food_lifespan.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/food_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/children/baby_food.dart';

void main() {
  group("Baby food:", () {
    test("baby food list has at least 5 baby food", () {
      expect(
        babyFood.length,
        greaterThanOrEqualTo(5),
      );
    });

    test("baby food name has at least 3 letters", () {
      for (var food in babyFood) {
        expect(
          food.name.trim().length,
          greaterThanOrEqualTo(3),
          reason: "Cause: $food",
        );
      }
    });

    //*this is supposed to ensure that all items in the list have a price.
    //*But at this point the game economy has not been worked out so there are no prices
    //*The moment prices are added this should fail so you need to:
    //! change it to check that all base prices are greater than the least priced item.
    test("base price is 0", () {
      for (var food in babyFood) {
        expect(
          food.basePrice,
          0,
          reason: "Cause: ${food.name}",
        );
      }
    });

    test("All baby food have a type of 'baby food'", () {
      for (var food in babyFood) {
        expect(
          food.type,
          FoodType.babyFood.name,
          reason: "Cause: ${food.name}",
        );
      }
    });

    test("All baby food have a short or mid lifespan", () {
      for (var food in babyFood) {
        expect(
          food.lifespanInDays,
          isIn([
            FoodLifespan.short.days,
            FoodLifespan.mid.days,
          ]),
          reason: "Cause: ${food.name}",
        );
      }
    });

    test("nutrition is in the range 1 - 100", () {
      for (var food in babyFood) {
        expect(
          food.nutrition,
          inInclusiveRange(1, 100),
          reason: "Cause: ${food.name}",
        );
      }
    });

    test("servings are in the range 1 - 10", () {
      for (var food in babyFood) {
        expect(
          food.servings,
          inInclusiveRange(1, 10),
          reason: "Cause: ${food.name}",
        );
      }
    });
  });
}
