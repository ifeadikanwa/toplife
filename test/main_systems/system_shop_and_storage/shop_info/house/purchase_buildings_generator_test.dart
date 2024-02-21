import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/building_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/house/purchase_buildings_generator.dart';

void main() {
  group("Purchase buildings generator:", () {
    group("Constants:", () {
      test(
        "max bedroom count is 5",
        () {
          expect(PurchaseBuildingsGenerator.maxBedroomCount, 5);
        },
      );

      test(
        "max bathroom count is 3",
        () {
          expect(PurchaseBuildingsGenerator.maxBathroomCount, 3);
        },
      );

      test(
        "low condition min is 40",
        () {
          expect(PurchaseBuildingsGenerator.lowConditionMin, 40);
        },
      );

      test(
        "low condition max is 70",
        () {
          expect(PurchaseBuildingsGenerator.lowConditionMax, 70);
        },
      );
    });

    group("Get four unique building types:", () {
      test(
        "generates 4 building types",
        () {
          final List<BuildingType> result =
              PurchaseBuildingsGenerator.getFourUniqueBuildingTypes();

          expect(result.length, 4);
        },
      );

      test(
        "all 4 building types are UNIQUE",
        () {
          final List<BuildingType> result =
              PurchaseBuildingsGenerator.getFourUniqueBuildingTypes();

          final uniqueValues = result.toSet();

          expect(uniqueValues.length, 4);
        },
      );
    });

    group("Generate:", () {
      test(
        "generates 12 houses",
        () {
          final List<House> result = PurchaseBuildingsGenerator.generate();

          expect(result.length, 12);
        },
      );

      test(
        "generates 4 houses for each settlement",
        () {
          final List<House> result = PurchaseBuildingsGenerator.generate();

          for (var settlement in Settlement.values) {
            expect(
              result
                  .where((house) => house.settlement == settlement.name)
                  .length,
              4,
              reason: "Cause: $settlement",
            );
          }
        },
      );

      test(
        "generates 6 houses with condition in range (lowConditionMin - lowConditionMax)",
        () {
          final List<House> result = PurchaseBuildingsGenerator.generate();

          final lowConditionHouses =
              result.where((house) => house.condition != 100);

          expect(
            lowConditionHouses.length,
            6,
            reason: "Cause: there are not 6 low condition houses.",
          );

          for (var house in lowConditionHouses) {
            expect(
              house.condition,
              inInclusiveRange(
                PurchaseBuildingsGenerator.lowConditionMin,
                PurchaseBuildingsGenerator.lowConditionMax,
              ),
              reason: "Cause: condition not in range. \nHouse: $house",
            );
          }
        },
      );

      test(
        "half the buildings have bedroom count in the range (1 -> maxBerooms/2)",
        () {
          final List<House> result = PurchaseBuildingsGenerator.generate();

          final lowPricedHouses = result.where((house) =>
              house.bedrooms <=
              (PurchaseBuildingsGenerator.maxBedroomCount ~/ 2));

          expect(
            lowPricedHouses.length,
            result.length ~/ 2,
          );
        },
      );

      test(
        "half the buildings have bedroom count in the range (maxBerooms/2 -> maxBedrooms)",
        () {
          final List<House> result = PurchaseBuildingsGenerator.generate();

          final highPricedHouses = result.where((house) =>
              house.bedrooms >
              (PurchaseBuildingsGenerator.maxBedroomCount ~/ 2));

          expect(
            highPricedHouses.length,
            result.length ~/ 2,
          );
        },
      );

      test(
        "all houses are NOT for rent",
        () {
          final List<House> result = PurchaseBuildingsGenerator.generate();

          for (var house in result) {
            expect(house.isForRent, false);
          }
        },
      );

      test(
        "houses are sorted in descending order of price",
        () {
          final List<House> result = PurchaseBuildingsGenerator.generate();

          for (int i = 1; i < result.length; i++) {
            expect(
              result[i - 1].basePrice >= result[i].basePrice,
              true,
              reason:
                  "Cause: index $i is greater than index ${i - 1}. \nList: $result",
            );
          }
        },
      );
    });
  });
}
