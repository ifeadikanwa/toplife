import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/food_lifespan.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/food_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/food/drinks.dart';

void main() {
  group("Drinks:", () {
    test("drinks list constain at least 5 drinks", () {
      expect(
        drinks.length,
        greaterThanOrEqualTo(5),
      );
    });

    test("drink names are at least 3 letters long", () {
      for (var drink in drinks) {
        expect(
          drink.name.trim().length,
          greaterThanOrEqualTo(3),
          reason: "Cause: $drink",
        );
      }
    });

    //*this is supposed to ensure that all items in the list have a price.
    //*But at this point the game economy has not been worked out so there are no prices
    //*The moment prices are added this should fail so you need to:
    //! change it to check that all base prices are greater than the least priced item.
    test("base price is 0", () {
      for (var drink in drinks) {
        expect(
          drink.basePrice,
          0,
          reason: "Cause: ${drink.name}",
        );
      }
    });

    test(
      "drinks list contains at least 3 energy drinks, non-alcoholic drinks and alcoholic drinks",
      () {
        const int minAmount = 3;
        expect(
          drinks
              .where((drink) => drink.type == FoodType.energyDrink.name)
              .length,
          greaterThan(minAmount),
          reason: "Cause: energy drinks",
        );

        expect(
          drinks
              .where((drink) => drink.type == FoodType.nonAlcoholicDrink.name)
              .length,
          greaterThan(minAmount),
          reason: "Cause: non-alcoholic drinks",
        );

        expect(
          drinks
              .where((drink) => drink.type == FoodType.alcoholicDrink.name)
              .length,
          greaterThan(minAmount),
          reason: "Cause: alcoholic drinks",
        );
      },
    );

    test("energy drinks have a short lifespan", () {
      final energyDrinks = drinks.where(
        (drink) => drink.type == FoodType.energyDrink.name,
      );

      for (var energyDrink in energyDrinks) {
        expect(
          energyDrink.lifespanInDays,
          FoodLifespan.short.days,
          reason: "Cause: ${energyDrink.name}",
        );
      }
    });

    test("alcoholic drinks have an indefinite lifespan", () {
      final alcoholicDrinks = drinks.where(
        (drink) => drink.type == FoodType.alcoholicDrink.name,
      );

      for (var alcoholicDrink in alcoholicDrinks) {
        expect(
          alcoholicDrink.lifespanInDays,
          FoodLifespan.indefinite.days,
          reason: "Cause: ${alcoholicDrink.name}",
        );
      }
    });

    test("drinks in the drinks list are not organic", () {
      for (var drink in drinks) {
        expect(
          drink.isOrganic,
          false,
          reason: "Cause: ${drink.name}",
        );
      }
    });

    test("nutrition is within the range 1 - 100", () {
      for (var drink in drinks) {
        expect(
          drink.nutrition,
          inInclusiveRange(1, 100),
          reason: "Cause: ${drink.name}",
        );
      }
    });

    test("servings is within the range 1 - 8", () {
      for (var drink in drinks) {
        expect(
          drink.servings,
          inInclusiveRange(1, 8),
          reason: "Cause: ${drink.name}",
        );
      }
    });
  });
}
