import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/food_lifespan.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/food_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/food/ingredients.dart';

void main() {
  group("Ingredients:", () {
    test("ingredients list contains at least 5 ingredients", () {
      expect(
        ingredients.length,
        greaterThanOrEqualTo(5),
      );
    });

    test("ingredient names contains at least 3 letters", () {
      for (var ingredient in ingredients) {
        expect(
          ingredient.name.trim().length,
          greaterThanOrEqualTo(3),
          reason: "Cause: $ingredient",
        );
      }
    });

    //*this is supposed to ensure that all items in the list have a price.
    //*But at this point the game economy has not been worked out so there are no prices
    //*The moment prices are added this should fail so you need to:
    //! change it to check that all base prices are greater than the least priced item.
    test("base price is 0", () {
      for (var ingredient in ingredients) {
        expect(
          ingredient.basePrice,
          0,
          reason: "Cause: ${ingredient.name}",
        );
      }
    });

    test("ingredients are of type 'ingredient'", () {
      for (var ingredient in ingredients) {
        expect(
          ingredient.type,
          FoodType.ingredient.name,
          reason: "Cause: ${ingredient.name}",
        );
      }
    });

    test("all ingredients have a mid lifespan", () {
      for (var ingredient in ingredients) {
        expect(
          ingredient.lifespanInDays,
          FoodLifespan.mid.days,
          reason: "Cause: ${ingredient.name}",
        );
      }
    });

    test("nutrition is in the range 1 - 100", () {
      for (var ingredient in ingredients) {
        expect(
          ingredient.nutrition,
          inInclusiveRange(1, 100),
          reason: "Cause: ${ingredient.name}",
        );
      }
    });

    test("servings are in the range 1 - 5", () {
      for (var ingredient in ingredients) {
        expect(
          ingredient.servings,
          inInclusiveRange(1, 5),
          reason: "Cause: ${ingredient.name}",
        );
      }
    });
  });
}
