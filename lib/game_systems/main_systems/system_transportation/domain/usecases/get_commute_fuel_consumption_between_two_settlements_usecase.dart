import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/default_road_commute_fuel_consumption.dart';

class GetCommuteFuelConsumptionBetweenTwoSettlementsUsecase {
  const GetCommuteFuelConsumptionBetweenTwoSettlementsUsecase();

  int execute({
    required Settlement startingSettlement,
    required Settlement destinationSettlement,
  }) {
    //inside a village
    if (startingSettlement == Settlement.Village &&
        destinationSettlement == Settlement.Village) {
      return DefaultRoadCommuteFuelConsumption.withinVillage;
    }

    //inside a town
    else if (startingSettlement == Settlement.Town &&
        destinationSettlement == Settlement.Town) {
      return DefaultRoadCommuteFuelConsumption.withinTown;
    }

    //inside a city
    else if (startingSettlement == Settlement.City &&
        destinationSettlement == Settlement.City) {
      return DefaultRoadCommuteFuelConsumption.withinCity;
    }

    //from town -> village or village -> town
    else if ((startingSettlement == Settlement.Town &&
            destinationSettlement == Settlement.Village) ||
        (startingSettlement == Settlement.Village &&
            destinationSettlement == Settlement.Town)) {
      return DefaultRoadCommuteFuelConsumption.townVillage;
    }

    //from town -> city or city -> town
    else if ((startingSettlement == Settlement.Town &&
            destinationSettlement == Settlement.City) ||
        (startingSettlement == Settlement.City &&
            destinationSettlement == Settlement.Town)) {
      return DefaultRoadCommuteFuelConsumption.townCity;
    }

    //from city -> village or village -> city
    else if ((startingSettlement == Settlement.City &&
            destinationSettlement == Settlement.Village) ||
        (startingSettlement == Settlement.Village &&
            destinationSettlement == Settlement.City)) {
      return DefaultRoadCommuteFuelConsumption.cityVillage;
    }

    //error case
    else {
      return 0;
    }
  }
}
