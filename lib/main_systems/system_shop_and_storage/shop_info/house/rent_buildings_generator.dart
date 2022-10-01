
import 'package:toplife/main_systems/system_shop_and_storage/constants/building_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/house/utils/house_utils.dart';

class RentBuildingsGenerator {
  static const int maxBedroomCount = 4;
  static const int maxBathroomCount = 2;

  static const List<BuildingType> buildingTypesAvailableToRent = [
    BuildingType.apartment,
    BuildingType.townhouse,
    BuildingType.condo,
  ];

  static const List<Settlement> settlementsWithRental = [
    Settlement.Town,
    Settlement.City,
  ];

  static List<House> generate() {
    List<House> rentBuildings = [];

    //for each settlement
    for (var settlement in settlementsWithRental) {
      //for each building type: generate 1 low priced and 1 high priced place
      for (var buildingType in buildingTypesAvailableToRent) {
        //low priced:
        rentBuildings.add(
          HouseUtils.generateBuilding(
            isLowPricedOption: true,
            buildingType: buildingType,
            settlement: settlement,
            isForRent: true,
            maxBedroomCount: maxBedroomCount,
            maxBathroomCount: maxBathroomCount,
          ),
        );

        //high priced:
        rentBuildings.add(
          HouseUtils.generateBuilding(
            isLowPricedOption: false,
            buildingType: buildingType,
            settlement: settlement,
            isForRent: true,
            maxBedroomCount: maxBedroomCount,
            maxBathroomCount: maxBathroomCount,
          ),
        );
      }
    }

    return HouseUtils.sortHousesInDescendingOrderOfBasePrice(rentBuildings);
  }
}
