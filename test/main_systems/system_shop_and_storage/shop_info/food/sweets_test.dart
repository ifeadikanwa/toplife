import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/food_lifespan.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/food_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/food/sweets.dart';

void main() {
  group("Sweets:", () {
     test("sweets list has at least 5 sweets", () {
      expect(
        sweets.length,
        greaterThanOrEqualTo(5),
      );
    });

    test("sweet name has at least 3 letters", () {
      for (var sweet in sweets) {
        expect(
          sweet.name.trim().length,
          greaterThanOrEqualTo(3),
          reason: "Cause: $sweet",
        );
      }
    });

    //*this is supposed to ensure that all items in the list have a price.
    //*But at this point the game economy has not been worked out so there are no prices
    //*The moment prices are added this should fail so you need to:
    //! change it to check that all base prices are greater than the least priced item.
    test("base price is 0", () {
      for (var sweet in sweets) {
        expect(
          sweet.basePrice,
          0,
          reason: "Cause: ${sweet.name}",
        );
      }
    });

    test("All sweets have a type of 'readyMeal'", () {
      for (var sweet in sweets) {
        expect(
          sweet.type,
          FoodType.readyMeal.name,
          reason: "Cause: ${sweet.name}",
        );
      }
    });

    test("All sweets have a short or mid lifespan", () {
      for (var sweet in sweets) {
        expect(
          sweet.lifespanInDays,
          isIn([
            FoodLifespan.short.days,
            FoodLifespan.mid.days,
          ]),
          reason: "Cause: ${sweet.name}",
        );
      }
    });

    test("All sweets are not organic", () {
      for (var sweet in sweets) {
        expect(
          sweet.isOrganic,
          false,
          reason: "Cause: ${sweet.name}",
        );
      }
    });

    test("nutrition is in the range 1 - 100", () {
      for (var sweet in sweets) {
        expect(
          sweet.nutrition,
          inInclusiveRange(1, 100),
          reason: "Cause: ${sweet.name}",
        );
      }
    });

    test("servings are in the range 1 - 10", () {
      for (var sweet in sweets) {
        expect(
          sweet.servings,
          inInclusiveRange(1, 10),
          reason: "Cause: ${sweet.name}",
        );
      }
    });
  });
}
