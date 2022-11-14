import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/food_lifespan.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/children/constants/breast_milk.dart';

void main() {
  group("BreastMilk:", () {
    test("low amount milk has the correct values for all it properties", () {
      expect(
        BreastMilk.lowAmount.name,
        "Breast Milk",
        reason: "Cause: name",
      );

      expect(
        BreastMilk.lowAmount.lifespanInDays,
        FoodLifespan.short.days,
        reason: "Cause: lifespan",
      );

      expect(
        BreastMilk.lowAmount.basePrice,
        0,
        reason: "Cause: base price",
      );

      expect(
        BreastMilk.lowAmount.nutrition,
        15,
        reason: "Cause: nutrition",
      );

      expect(
        BreastMilk.lowAmount.servings,
        1,
        reason: "Cause: servings",
      );

      expect(
        BreastMilk.lowAmount.isOrganic,
        false,
        reason: "Cause: isOrganic",
      );
    });

    test("regular amount milk has the correct values for all it properties",
        () {
      expect(
        BreastMilk.regularAmount.name,
        "Breast Milk",
        reason: "Cause: name",
      );

      expect(
        BreastMilk.regularAmount.lifespanInDays,
        FoodLifespan.short.days,
        reason: "Cause: lifespan",
      );

       expect(
        BreastMilk.regularAmount.basePrice,
        0,
        reason: "Cause: base price",
      );

      expect(
        BreastMilk.regularAmount.nutrition,
        30,
        reason: "Cause: nutrition",
      );

      expect(
        BreastMilk.regularAmount.servings,
        1,
        reason: "Cause: servings",
      );

      expect(
        BreastMilk.regularAmount.isOrganic,
        false,
        reason: "Cause: isOrganic",
      );
    });

    test("high amount milk has the correct values for all it properties", () {
      expect(
        BreastMilk.highAmount.name,
        "Breast Milk",
        reason: "Cause: name",
      );

      expect(
        BreastMilk.highAmount.lifespanInDays,
        FoodLifespan.short.days,
        reason: "Cause: lifespan",
      );

       expect(
        BreastMilk.highAmount.basePrice,
        0,
        reason: "Cause: base price",
      );

      expect(
        BreastMilk.highAmount.nutrition,
        45,
        reason: "Cause: nutrition",
      );

      expect(
        BreastMilk.highAmount.servings,
        1,
        reason: "Cause: servings",
      );

      expect(
        BreastMilk.highAmount.isOrganic,
        false,
        reason: "Cause: isOrganic",
      );
    });
  });
}
