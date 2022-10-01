import 'dart:collection';
import 'dart:math';

import 'package:toplife/main_systems/system_shop_and_storage/constants/building_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/house/utils/house_utils.dart';

class PurchaseBuildingsGenerator {
  static const maxBedroomCount = 5;
  static const maxBathroomCount = 3;

  static const lowConditionMin = 40;
  static const lowConditionMax = 70;

  static List<House> generate() {
    List<House> purchaseBuildings = [];

    //for each settlement
    for (var settlement in Settlement.values) {
      bool generatedLowPricedLowConditionHouse = false;
      bool generatedHighPricedLowConditionHouse = false;

      //generate 4 random unique building types
      List<BuildingType> buildingTypes = getFourUniqueBuildingTypes();

      //for each building type
      for (var i = 0; i < buildingTypes.length; i++) {
        //first 2 low priced options, last 2 high priced options
        //1 low priced option is low condition, 1 high priced option is low condition
        if (i < (buildingTypes.length ~/ 2)) {
          House lowPricedGeneratedBuilding = HouseUtils.generateBuilding(
            isLowPricedOption: true,
            buildingType: buildingTypes[i],
            settlement: settlement,
            isForRent: false,
            maxBedroomCount: maxBedroomCount,
            maxBathroomCount: maxBathroomCount,
          );

          if (generatedLowPricedLowConditionHouse != true) {
            //change condition to a number btw 40 - 70
            lowPricedGeneratedBuilding = lowPricedGeneratedBuilding.copyWith(
              condition: Random().nextInt(lowConditionMax - lowConditionMin) +
                  lowConditionMin,
            );
            generatedLowPricedLowConditionHouse = true;
          }

          purchaseBuildings.add(lowPricedGeneratedBuilding);
        } else {
          House highPricedGeneratedBuilding = HouseUtils.generateBuilding(
            isLowPricedOption: false,
            buildingType: buildingTypes[i],
            settlement: settlement,
            isForRent: false,
            maxBedroomCount: maxBedroomCount,
            maxBathroomCount: maxBathroomCount,
          );

          if (generatedHighPricedLowConditionHouse != true) {
            //change condition to a number btw 40 - 70
            highPricedGeneratedBuilding = highPricedGeneratedBuilding.copyWith(
              condition: Random().nextInt(lowConditionMax - lowConditionMin) +
                  lowConditionMin,
            );
            generatedHighPricedLowConditionHouse = true;
          }

          purchaseBuildings.add(highPricedGeneratedBuilding);
        }
      }
    }

    return HouseUtils.sortHousesInDescendingOrderOfBasePrice(purchaseBuildings);
  }

  static List<BuildingType> getFourUniqueBuildingTypes() {
    HashSet<BuildingType> buildingTypes = HashSet.of({});

    //keep trying while length is less than 4.
    while ((buildingTypes.length < 4)) {
      //to make this loop error proof, if the length of building types happens to be less than 4
      //we want to stop when the list length == building types length - 1.(we will never add apartment so it's -1)
      //so it's not an endless loop
      if (buildingTypes.length == (BuildingType.values.length - 1)) {
        break;
      }

      //*The actual action:

      //get a random index
      int randomIndex = Random().nextInt(BuildingType.values.length);

      BuildingType generatedBuilding = BuildingType.values[randomIndex];

      //if it isn't an apartment and it doesnt already exist in the list add it
      if (generatedBuilding != BuildingType.apartment &&
          !(buildingTypes.contains(generatedBuilding))) {
        buildingTypes.add(generatedBuilding);
      }
    }

    return buildingTypes.toList();
  }
}
