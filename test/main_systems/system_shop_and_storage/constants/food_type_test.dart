// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/food_type.dart';

void main() {
  group("Food type:", () {
    test("ingredient is a food type", () {
      assert(FoodType.ingredient is FoodType);
    });

    test("ready meal is a food type", () {
      assert(FoodType.readyMeal is FoodType);
    });

    test("baby food is a food type", () {
      assert(FoodType.babyFood is FoodType);
    });

    test("energy drink is a food type", () {
      assert(FoodType.energyDrink is FoodType);
    });

    test("alcoholic drink is a food type", () {
      assert(FoodType.alcoholicDrink is FoodType);
    });

    test("non-alcoholic is a food type", () {
      assert(FoodType.nonAlcoholicDrink is FoodType);
    });
  });
}
