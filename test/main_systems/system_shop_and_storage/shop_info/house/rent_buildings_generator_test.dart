import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/building_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/house/rent_buildings_generator.dart';

void main() {
  group("Rent buildings generator:", () {
    group("Constants:", () {
      test(
        "max bedroom count is 4",
        () {
          expect(RentBuildingsGenerator.maxBedroomCount, 4);
        },
      );

      test(
        "max bathroom count is 2",
        () {
          expect(RentBuildingsGenerator.maxBathroomCount, 2);
        },
      );

      test(
        "building types available to rent are apartment, townhouse and condo",
        () {
          expect(
            RentBuildingsGenerator.buildingTypesAvailableToRent,
            [
              BuildingType.apartment,
              BuildingType.townhouse,
              BuildingType.condo,
            ],
          );
        },
      );

      test(
        "settlements with rentals are city and town",
        () {
          expect(
            RentBuildingsGenerator.settlementsWithRental,
            [
              Settlement.Town,
              Settlement.City,
            ],
          );
        },
      );
    });

    group("Generate:", () {
      test(
        "generates 12 houses",
        () {
          final List<House> result = RentBuildingsGenerator.generate();

          expect(result.length, 12);
        },
      );

      test(
        "generates 6 houses for each valid settlement",
        () {
          final List<House> result = RentBuildingsGenerator.generate();

          for (var settlement in RentBuildingsGenerator.settlementsWithRental) {
            expect(
              result
                  .where((house) => house.settlement == settlement.name)
                  .length,
              6,
              reason: "Cause: $settlement",
            );
          }
        },
      );

      test(
        "generates 4 houses in total for each valid building type",
        () {
          final List<House> result = RentBuildingsGenerator.generate();

          for (var buildingType
              in RentBuildingsGenerator.buildingTypesAvailableToRent) {
            expect(
              result
                  .where((house) => house.buildingType == buildingType.name)
                  .length,
              4,
              reason: "Cause: $buildingType",
            );
          }
        },
      );

      test(
        "half the buildings have bedroom count in the range (1 -> maxBerooms/2)",
        () {
          final List<House> result = RentBuildingsGenerator.generate();

          final lowPricedHouses = result.where((house) =>
              house.bedrooms <= (RentBuildingsGenerator.maxBedroomCount ~/ 2));

          expect(
            lowPricedHouses.length,
            result.length ~/ 2,
          );
        },
      );

      test(
        "half the buildings have bedroom count in the range (maxBerooms/2 -> maxBedrooms)",
        () {
          final List<House> result = RentBuildingsGenerator.generate();

          final highPricedHouses = result.where((house) =>
              house.bedrooms > (RentBuildingsGenerator.maxBedroomCount ~/ 2));

          expect(
            highPricedHouses.length,
            result.length ~/ 2,
          );
        },
      );

      test(
        "all houses ARE for rent",
        () {
          final List<House> result = RentBuildingsGenerator.generate();

          for (var house in result) {
            expect(house.isForRent, true);
          }
        },
      );

      test(
        "houses are sorted in descending order of price",
        () {
          final List<House> result = RentBuildingsGenerator.generate();

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
