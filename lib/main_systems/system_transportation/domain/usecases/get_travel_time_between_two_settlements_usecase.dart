import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/main_systems/system_transportation/constants/default_road_travel_time.dart';

class GetTravelTimeBetweenTwoSettlementsUsecase {
  const GetTravelTimeBetweenTwoSettlementsUsecase();

  int execute({
    required Settlement startingSettlement,
    required Settlement destinationSettlement,
  }) {
    //inside a village
    if (startingSettlement == Settlement.Village &&
        destinationSettlement == Settlement.Village) {
      return DefaultRoadTravelTime.withinVillageTimeInMinutes;
    }

    //inside a town
    else if (startingSettlement == Settlement.Town &&
        destinationSettlement == Settlement.Town) {
      return DefaultRoadTravelTime.withinTownTimeInMinutes;
    }

    //inside a city
    else if (startingSettlement == Settlement.City &&
        destinationSettlement == Settlement.City) {
      return DefaultRoadTravelTime.withinCityTimeInMinutes;
    }

    //from town -> village or village -> town
    else if ((startingSettlement == Settlement.Town &&
            destinationSettlement == Settlement.Village) ||
        (startingSettlement == Settlement.Village &&
            destinationSettlement == Settlement.Town)) {
      return DefaultRoadTravelTime.townVillageTimeInMinutes;
    }

    //from town -> city or city -> town
    else if ((startingSettlement == Settlement.Town &&
            destinationSettlement == Settlement.City) ||
        (startingSettlement == Settlement.City &&
            destinationSettlement == Settlement.Town)) {
      return DefaultRoadTravelTime.townCityTimeInMinutes;
    }

    //from city -> village or village -> city
    else if ((startingSettlement == Settlement.City &&
            destinationSettlement == Settlement.Village) ||
        (startingSettlement == Settlement.Village &&
            destinationSettlement == Settlement.City)) {
      return DefaultRoadTravelTime.cityVillageTimeInMinutes;
    }

    //error case
    else {
      return 0;
    }
  }
}
