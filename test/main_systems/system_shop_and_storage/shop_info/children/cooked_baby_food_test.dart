import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/food_lifespan.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/food_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/children/cooked_baby_food.dart';

void main() {
  group("Cooked baby food:", () {
    test("list has at least 5 cooked food", () {
      expect(
        cookedBabyFood.length,
        greaterThanOrEqualTo(5),
      );
    });

    test("food name has at least 3 letters", () {
      for (var cookedFood in cookedBabyFood) {
        expect(
          cookedFood.food.name.trim().length,
          greaterThanOrEqualTo(3),
          reason: "Cause: $cookedFood",
        );
      }
    });

    test("food needs at least one ingredient", () {
      for (var cookedFood in cookedBabyFood) {
        expect(
          cookedFood.ingredients.length,
          greaterThanOrEqualTo(1),
          reason: "Cause: ${cookedFood.food.name}",
        );
      }
    });

    test("base price is 0", () {
      for (var cookedFood in cookedBabyFood) {
        expect(
          cookedFood.food.basePrice,
          0,
          reason: "Cause: ${cookedFood.food.name}",
        );
      }
    });

    test("all food type is baby food", () {
      for (var cookedFood in cookedBabyFood) {
        expect(
          cookedFood.food.type,
          FoodType.babyFood.name,
          reason: "Cause: ${cookedFood.food.name}",
        );
      }
    });

    test("all food have a long lifespan", () {
      for (var cookedFood in cookedBabyFood) {
        expect(
          cookedFood.food.lifespanInDays,
          FoodLifespan.long.days,
          reason: "Cause: ${cookedFood.food.name}",
        );
      }
    });

    test("all food have a nutrition of 40", () {
      for (var cookedFood in cookedBabyFood) {
        expect(
          cookedFood.food.nutrition,
          40,
          reason: "Cause: ${cookedFood.food.name}",
        );
      }
    });

    test("all food are organic", () {
      for (var cookedFood in cookedBabyFood) {
        expect(
          cookedFood.food.isOrganic,
          true,
          reason: "Cause: ${cookedFood.food.name}",
        );
      }
    });

    test("all food have 1 serving", () {
      for (var cookedFood in cookedBabyFood) {
        expect(
          cookedFood.food.servings,
          1,
          reason: "Cause: ${cookedFood.food.name}",
        );
      }
    });
  });
}
