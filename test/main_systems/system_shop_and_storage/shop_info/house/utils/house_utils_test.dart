import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/building_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/house_design_style.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/house/utils/house_utils.dart';

void main() {
  group("House Utils:", () {
    const int bedroomCount = 1;
    const int bathroomCount = 1;
    const buildingType = BuildingType.apartment;

    group("Constants:", () {
      test("rent price percentage is 10%", () {
        expect(HouseUtils.rentPricePercentage, 0.1);
      });
      test("max building price fluctuation percentage is 5", () {
        expect(HouseUtils.maxBuildingPriceFluctuationPercentage, 5);
      });
      test("max storage space fluctuator is 4", () {
        expect(HouseUtils.maxStorageSpaceFluctuator, 4);
      });

      test("fluctuationCanBeNegative is true", () {
        expect(HouseUtils.fluctuationCanBeNegative, true);
      });
    });

    group("building price calculator:", () {
      test(
        "price returned is greater than (lowest negative fluctuation of bedroom price + lowest negative fluctuation of bathroom price) and less than (highest positive fluctuation of bedroom price + highest positive fluctuation of bathroom price)",
        () {
          final bedroomStandardPrice =
              buildingType.basePricePerBedroom * bedroomCount;

          final bathroomStandardPrice =
              buildingType.basePricePerBathroom * bathroomCount;

          const lowestFluctuator =
              (-HouseUtils.maxBuildingPriceFluctuationPercentage / 100);

          const highestFluctuator =
              (HouseUtils.maxBuildingPriceFluctuationPercentage / 100);

          final lowestPossibleBuildingPrice =
              ((lowestFluctuator * bedroomStandardPrice) +
                      bedroomStandardPrice) +
                  ((lowestFluctuator * bathroomStandardPrice) +
                      bathroomStandardPrice);

          final highestPossibleBuildingPrice =
              ((highestFluctuator * bedroomStandardPrice) +
                      bedroomStandardPrice) +
                  ((highestFluctuator * bathroomStandardPrice) +
                      bathroomStandardPrice);

          final result = HouseUtils.buildingPriceCalculator(
            buildingType: buildingType,
            bedroomCount: bedroomCount,
            bathroomCount: bathroomCount,
          );

          expect(
            result,
            inInclusiveRange(
              lowestPossibleBuildingPrice,
              highestPossibleBuildingPrice,
            ),
          );
        },
      );
    });

    group("Adjust house price based on settlement:", () {
      const int housePrice = 100;
      test(
        "house price is doubled in city settlement",
        () {
          expect(
            HouseUtils.adjustHousePriceBasedOnSettlement(
              settlement: Settlement.City,
              housePrice: housePrice,
            ),
            housePrice * 2,
          );
        },
      );

      test(
        "house price increases by half in town settlement",
        () {
          expect(
            HouseUtils.adjustHousePriceBasedOnSettlement(
              settlement: Settlement.Town,
              housePrice: housePrice,
            ),
            housePrice + (housePrice / 2),
          );
        },
      );

      test(
        "house price is the same in village settlement",
        () {
          expect(
            HouseUtils.adjustHousePriceBasedOnSettlement(
              settlement: Settlement.Village,
              housePrice: housePrice,
            ),
            housePrice,
          );
        },
      );
    });

    group("Rent price calculator:", () {
      test(
        "rent price is within the range of rentPricePercentage of the lowest and highest possible building price",
        () {
          final bedroomStandardPrice =
              buildingType.basePricePerBedroom * bedroomCount;

          final bathroomStandardPrice =
              buildingType.basePricePerBathroom * bathroomCount;

          const lowestFluctuator =
              (-HouseUtils.maxBuildingPriceFluctuationPercentage / 100);

          const highestFluctuator =
              (HouseUtils.maxBuildingPriceFluctuationPercentage / 100);

          final lowestPossibleBuildingPrice =
              ((lowestFluctuator * bedroomStandardPrice) +
                      bedroomStandardPrice) +
                  ((lowestFluctuator * bathroomStandardPrice) +
                      bathroomStandardPrice);

          final lowestPossibleRentPrice =
              HouseUtils.rentPricePercentage * lowestPossibleBuildingPrice;

          final highestPossibleBuildingPrice =
              ((highestFluctuator * bedroomStandardPrice) +
                      bedroomStandardPrice) +
                  ((highestFluctuator * bathroomStandardPrice) +
                      bathroomStandardPrice);

          final highestPossibleRentPrice =
              HouseUtils.rentPricePercentage * highestPossibleBuildingPrice;

          final result = HouseUtils.rentPriceCalculator(
            buildingType: buildingType,
            bedroomCount: bedroomCount,
            bathroomCount: bathroomCount,
          );

          expect(
            result,
            inInclusiveRange(
              lowestPossibleRentPrice,
              highestPossibleRentPrice,
            ),
          );
        },
      );
    });

    group("Storage space calculator:", () {
      test(
        "returns a number within the range (standard storage - maxStorageSpaceFluctuator) to (standard storage + maxStorageSpaceFluctuator)",
        () {
          final int standardStorage =
              (bedroomCount * buildingType.storagePerSpace) +
                  (bathroomCount * (buildingType.storagePerSpace ~/ 2));

          final lowestPossibleStorage =
              standardStorage - HouseUtils.maxStorageSpaceFluctuator;

          final highestPossibleStorage =
              standardStorage + HouseUtils.maxStorageSpaceFluctuator;

          final int result = HouseUtils.storageSpaceCalculator(
            buildingType: buildingType,
            bedroomCount: bedroomCount,
            bathroomCount: bathroomCount,
          );

          expect(
            result,
            inInclusiveRange(
              lowestPossibleStorage,
              highestPossibleStorage,
            ),
          );
        },
      );
    });

    group("Get random bedroom count:", () {
      const int maxBedrooms = 5;
      test(
        "when upperhalf is true, it returns a number in the first half of the range 1 - maxBedrooms",
        () {
          final result = HouseUtils.getRandomBedroomCount(
            maxBedrooms: maxBedrooms,
            inUpperHalf: true,
          );

          expect(
            result,
            isIn([1, 2]),
          );
        },
      );

      test(
        "when upperhalf is false, it returns a number in the second half of the range 1 - maxBedrooms",
        () {
          final result = HouseUtils.getRandomBedroomCount(
            maxBedrooms: maxBedrooms,
            inUpperHalf: false,
          );

          expect(
            result,
            isIn([3, 4, 5]),
          );
        },
      );
    });

    group("Get random bathroom count:", () {
      const int maxBathrooms = 3;

      test(
        "when bedroom count is 1, it returns 1 bathroom count",
        () {
          final result = HouseUtils.getRandomBathroomCount(
            maxBathrooms: maxBathrooms,
            bedroomCount: 1,
          );

          expect(result, 1);
        },
      );

      test(
        "when bedroom count is 2, it returns 1 or 2 bathroom count",
        () {
          final result = HouseUtils.getRandomBathroomCount(
            maxBathrooms: maxBathrooms,
            bedroomCount: 2,
          );

          expect(result, isIn([1, 2]));
        },
      );

      test(
        "when bedroom count is greater than 2, it returns any number in the range 1 - maxBathrooms",
        () {
          final result = HouseUtils.getRandomBathroomCount(
            maxBathrooms: maxBathrooms,
            bedroomCount: 6,
          );

          expect(
            result,
            inInclusiveRange(1, maxBathrooms),
          );
        },
      );
    });

    group("Sort Houses In Descending Order Of Base Price:", () {
      test(
        "returns a list of houses sorted in descending order of price",
        () {
          const House houseTemplate = House(
            id: 0,
            ownerPersonId: 8,
            country: "",
            state: "",
            endOfLeaseDay: 0,
            fullyPaidFor: true,
            bedrooms: 1,
            bathrooms: 1,
            storage: 1,
            address: "address",
            isForRent: false,
            buildingType: "buildingType",
            settlement: "settlement",
            style: "style",
            lastMaintainedDay: 0,
            basePrice: 0,
            dayOfPurchase: 0,
            condition: 0,
            purchasePrice: 0,
          );

          final List<House> testList = [
            houseTemplate.copyWith(basePrice: 100),
            houseTemplate.copyWith(basePrice: 250),
            houseTemplate.copyWith(basePrice: 180),
          ];

          final List<House> result =
              HouseUtils.sortHousesInDescendingOrderOfBasePrice(testList);

          //starting from the 2nd house, the previous house price should be larger than the current house price
          for (var i = 1; i < result.length; i++) {
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

    group("Generate building:", () {
      const BuildingType buildingType = BuildingType.apartment;
      const int maxBedrooms = 5;
      const int maxBathrooms = 4;
      const Settlement settlement = Settlement.Town;
      test(
        "when isForRent is true it returns a building for rent",
        () {
          final result = HouseUtils.generateBuilding(
            isLowPricedOption: true,
            buildingType: buildingType,
            settlement: settlement,
            isForRent: true,
            maxBedroomCount: maxBedrooms,
            maxBathroomCount: maxBathrooms,
          );

          expect(
            result.isForRent,
            true,
          );
        },
      );

      test(
        "when isForRent is false it returns a building not for rent",
        () {
          final result = HouseUtils.generateBuilding(
            isLowPricedOption: true,
            buildingType: buildingType,
            settlement: settlement,
            isForRent: false,
            maxBedroomCount: maxBedrooms,
            maxBathroomCount: maxBathrooms,
          );

          expect(
            result.isForRent,
            false,
          );
        },
      );

      test(
        "when isLowPricedOption is true it returns a building with bedroom count in the first half of the range 1 - maxBedrooms",
        () {
          final result = HouseUtils.generateBuilding(
            isLowPricedOption: true,
            buildingType: buildingType,
            settlement: settlement,
            isForRent: true,
            maxBedroomCount: maxBedrooms,
            maxBathroomCount: maxBathrooms,
          );

          expect(
            result.bedrooms,
            inInclusiveRange(1, maxBedrooms ~/ 2),
          );
        },
      );

      test(
        "when isLowPricedOption is false it returns a building with bedroom count in the second half of the range 1 - maxBedrooms",
        () {
          final result = HouseUtils.generateBuilding(
            isLowPricedOption: false,
            buildingType: buildingType,
            settlement: settlement,
            isForRent: true,
            maxBedroomCount: maxBedrooms,
            maxBathroomCount: maxBathrooms,
          );

          expect(
            result.bedrooms,
            inInclusiveRange((maxBedrooms ~/ 2) + 1, maxBedrooms),
          );
        },
      );

      test(
        "generates building with address",
        () {
          final result = HouseUtils.generateBuilding(
            isLowPricedOption: true,
            buildingType: buildingType,
            settlement: settlement,
            isForRent: true,
            maxBedroomCount: maxBedrooms,
            maxBathroomCount: maxBathrooms,
          );

          expect(
            result.address.trim().length,
            greaterThan(0),
          );
        },
      );

      test(
        "generates building with storage space",
        () {
          final result = HouseUtils.generateBuilding(
            isLowPricedOption: true,
            buildingType: buildingType,
            settlement: settlement,
            isForRent: true,
            maxBedroomCount: maxBedrooms,
            maxBathroomCount: maxBathrooms,
          );

          expect(
            result.storage,
            greaterThan(0),
          );
        },
      );

      test(
        "generates building with settlement and building type",
        () {
          final result = HouseUtils.generateBuilding(
            isLowPricedOption: true,
            buildingType: buildingType,
            settlement: settlement,
            isForRent: true,
            maxBedroomCount: maxBedrooms,
            maxBathroomCount: maxBathrooms,
          );

          expect(
            result.settlement.trim().length,
            greaterThan(0),
            reason: "Cause: settlement",
          );

          expect(
            result.buildingType.trim().length,
            greaterThan(0),
            reason: "Cause: building type",
          );
        },
      );

      test(
        "generates building with valid house design style",
        () {
          final result = HouseUtils.generateBuilding(
            isLowPricedOption: true,
            buildingType: buildingType,
            settlement: settlement,
            isForRent: true,
            maxBedroomCount: maxBedrooms,
            maxBathroomCount: maxBathrooms,
          );

          expect(
            result.style,
            isIn(HouseDesignStyle.values.asNameMap()),
          );
        },
      );
    });
  });
}
