import 'dart:math';

import 'package:toplife/core/utils/numbers/fluctuate_number.dart';
import 'package:toplife/core/utils/numbers/get_negative_or_positive_multiplier.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/building_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/house_design_style.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/house/utils/get_random_address.dart';

class HouseUtils {
  static const maxBuildingPriceFluctuationPercentage = 5;

  //rent is 20% of the full regular building price
  static const double rentPricePercentage = 0.2;

  static const bool fluctuationCanBeNegative = true;

  static const maxStorageSpaceFluctuator = 4;

  static int buildingPriceCalculator({
    required BuildingType buildingType,
    required int bedroomCount,
    required int bathroomCount,
  }) {
    final int bedroomBasePrice =
        buildingType.basePricePerBedroom * bedroomCount;

    final int fluctuatedBedroomPrice = fluctuateNumber(
      number: bedroomBasePrice.toDouble(),
      maxPercentage: maxBuildingPriceFluctuationPercentage,
      canBeNegativeFluctuation: fluctuationCanBeNegative,
    ).round();

    final int bathroomBasePrice =
        buildingType.basePricePerBathroom * bathroomCount;

    final int fluctuatedBathroomPrice = fluctuateNumber(
      number: bathroomBasePrice.toDouble(),
      maxPercentage: maxBuildingPriceFluctuationPercentage,
      canBeNegativeFluctuation: fluctuationCanBeNegative,
    ).round();

    final int buildingPrice = fluctuatedBedroomPrice + fluctuatedBathroomPrice;

    return buildingPrice;
  }

  static int adjustHousePriceBasedOnSettlement({
    required Settlement settlement,
    required int housePrice,
  }) {
    //double
    if (settlement == Settlement.City) {
      return housePrice * 2;
    }
    //increase by half
    else if (settlement == Settlement.Town) {
      return (housePrice * 1.5).round();
    }
    //use the regular price
    else {
      return housePrice;
    }
  }

  static int rentPriceCalculator({
    required BuildingType buildingType,
    required int bedroomCount,
    required int bathroomCount,
  }) {
    final int buildingPrice = HouseUtils.buildingPriceCalculator(
      buildingType: buildingType,
      bedroomCount: bedroomCount,
      bathroomCount: bathroomCount,
    );

    final int rentPrice = (buildingPrice * rentPricePercentage).round();

    return rentPrice;
  }

  static int storageSpaceCalculator({
    required BuildingType buildingType,
    required int bedroomCount,
    required int bathroomCount,
  }) {
    //full storage space per bedroom
    //half storage space per bathroom
    //add a random number between (-3 to +3) for variabiltity

    final int storageSpace = (bedroomCount * buildingType.storagePerSpace) +
        (bathroomCount * (buildingType.storagePerSpace ~/ 2)) +
        (Random().nextInt(maxStorageSpaceFluctuator) *
                getNegativeOrPositiveMultiplier())
            .toInt();

    return storageSpace;
  }

  static int getRandomBedroomCount({
    required int maxBedrooms,
    required bool inUpperHalf,
  }) {
    if (inUpperHalf) {
      //random number in first half of range
      //add 1 because 0 is not a valid number
      return Random().nextInt(maxBedrooms ~/ 2) + 1;
    } else {
      //random number in the second half
      return Random().nextInt((maxBedrooms / 2).ceil()) +
          (maxBedrooms ~/ 2) +
          1;
    }
  }

  static int getRandomBathroomCount({
    required int maxBathrooms,
    required int bedroomCount,
  }) {
    //1 bedroom should have only 1 bathroom
    if (bedroomCount == 1) {
      return 1;
    }
    //if max bathroom is greater than 2 and we have a 2 bedroom count then we should only have 1 or 2 bathrooms
    else if (maxBathrooms > 2 && bedroomCount == 2) {
      return Random().nextInt(2) + 1;
    }
    //just pick a random number in the entire range
    else {
      return Random().nextInt(maxBathrooms) + 1;
    }
  }

  static List<House> sortHousesInDescendingOrderOfBasePrice(
    List<House> houses,
  ) {
    houses.sort((a, b) => b.basePrice.compareTo(a.basePrice));
    return houses;
  }

  static House generateBuilding({
    required bool isLowPricedOption,
    required BuildingType buildingType,
    required Settlement settlement,
    required bool isForRent,
    required int maxBedroomCount,
    required int maxBathroomCount,
  }) {
    //generate the valid bedroom count for the price option
    late final int bedroomCount;
    if (isLowPricedOption) {
      bedroomCount = HouseUtils.getRandomBedroomCount(
        maxBedrooms: maxBedroomCount,
        inUpperHalf: true,
      );
    } else {
      bedroomCount = HouseUtils.getRandomBedroomCount(
        maxBedrooms: maxBedroomCount,
        inUpperHalf: false,
      );
    }

    final int bathroomCount = HouseUtils.getRandomBathroomCount(
      maxBathrooms: maxBathroomCount,
      bedroomCount: bedroomCount,
    );

    //generate price taking into account if it is a rental or purchase
    late final int price;
    if (isForRent) {
      price = rentPriceCalculator(
        buildingType: buildingType,
        bedroomCount: bedroomCount,
        bathroomCount: bathroomCount,
      );
    } else {
      final int housePrice = buildingPriceCalculator(
        buildingType: buildingType,
        bedroomCount: bedroomCount,
        bathroomCount: bathroomCount,
      );

      price = adjustHousePriceBasedOnSettlement(
        settlement: settlement,
        housePrice: housePrice,
      );
    }

    //generate storage space
    final int storageSpace = HouseUtils.storageSpaceCalculator(
      buildingType: buildingType,
      bedroomCount: bedroomCount,
      bathroomCount: bathroomCount,
    );

    //get random house design style
    final int randomStyleIndex =
        Random().nextInt(HouseDesignStyle.values.length);

    final HouseDesignStyle houseDesignStyle =
        HouseDesignStyle.values[randomStyleIndex];

    //return house containing all the information
    return House(
      bedrooms: bedroomCount,
      bathrooms: bathroomCount,
      storage: storageSpace,
      address: getRandomAddress(),
      isForRent: isForRent,
      buildingType: buildingType.name,
      settlement: settlement.name,
      style: houseDesignStyle.name,
      basePrice: price,
      lastMaintainedDay: 0,
      dayOfPurchase: 0,
      condition: maxStatsValue,
      purchasePrice: 0,
    );
  }
}
