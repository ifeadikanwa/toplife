import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/children/baby_food.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/children/baby_items.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/children/cooked_baby_food.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/food/cooked_meals.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/food/drinks.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/food/ingredients.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/food/ready_meals.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/food/sweets.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/shop.dart';

void main() {
  group("Shop:", () {
    test(
      "ready meals list is correct",
      () {
        expect(
          Shop.readyMealsList,
          readyMeals.toList(),
        );
      },
    );

    test(
      "drinks list is correct",
      () {
        expect(
          Shop.drinksList,
          drinks.toList(),
        );
      },
    );

    test(
      "ingredients list is correct",
      () {
        expect(
          Shop.ingredientsList,
          ingredients.toList(),
        );
      },
    );

    test(
      "sweets list is correct",
      () {
        expect(
          Shop.sweetsList,
          sweets.toList(),
        );
      },
    );

    test(
      "babyFood list is correct",
      () {
        expect(
          Shop.babyFoodList,
          babyFood.toList(),
        );
      },
    );

    test(
      "babyItems list is correct",
      () {
        expect(
          Shop.babyItemsList,
          babyItems.toList(),
        );
      },
    );

    test(
      "cookedMeals list is correct",
      () {
        expect(
          Shop.cookedMealsList,
          cookedMeals.toList(),
        );
      },
    );

    test(
      "cookedBabyFood list is correct",
      () {
        expect(
          Shop.cookedBabyFoodList,
          cookedBabyFood.toList(),
        );
      },
    );
  });
}
