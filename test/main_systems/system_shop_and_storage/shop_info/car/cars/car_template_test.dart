import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/cars/car_template.dart';

void main() {
  group("Car template:", () {
    test(
      "all properties have the correct values",
      () {
        expect(
          carTemplate.name,
          "",
          reason: "Cause: name",
        );

        expect(
          carTemplate.type,
          "",
          reason: "Cause: type",
        );

        expect(
          carTemplate.percentageOfTravelTime,
          100,
          reason: "Cause: travel time",
        );

        expect(
          carTemplate.quality,
          "low",
          reason: "Cause: quality",
        );

        expect(
          carTemplate.basePrice,
          0,
          reason: "Cause: base price",
        );

        expect(
          carTemplate.dayOfPurchase,
          0,
          reason: "Cause: day of purchase",
        );

        expect(
          carTemplate.fuelTank,
          100,
          reason: "Cause: fuel tank",
        );

        expect(
          carTemplate.useCondition,
          100,
          reason: "Cause: use condition",
        );

        expect(
          carTemplate.maxConditionAtPurchase,
          100,
          reason: "Cause: max condition at purchase",
        );

        expect(
          carTemplate.isInsured,
          false,
          reason: "Cause: is insured",
        );

        expect(
          carTemplate.insuranceCost,
          0,
          reason: "Cause: insurance cost",
        );
      },
    );
  });
}
