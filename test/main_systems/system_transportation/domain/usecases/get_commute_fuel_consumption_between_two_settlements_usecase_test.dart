import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/default_road_commute_fuel_consumption.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/get_commute_fuel_consumption_between_two_settlements_usecase.dart';

void main() {
  group('Get commute fuel consumption between two settlements usecase:', () {
    const usecase = GetCommuteFuelConsumptionBetweenTwoSettlementsUsecase();
    test(
      "if starting and destination settlement is village, then fuel consumption is equal to within village fual consumption.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.Village,
          destinationSettlement: Settlement.Village,
        ),
        DefaultRoadCommuteFuelConsumption.withinVillage,
      ),
    );

    test(
      "if starting and destination settlement is town, then fuel consumption is equal to within town fual consumption.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.Town,
          destinationSettlement: Settlement.Town,
        ),
        DefaultRoadCommuteFuelConsumption.withinTown,
      ),
    );

    test(
      "if starting and destination settlement is city, then fuel consumption is equal to within city fual consumption.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.City,
          destinationSettlement: Settlement.City,
        ),
        DefaultRoadCommuteFuelConsumption.withinCity,
      ),
    );

    test(
      "if starting settlement is town and destination settlement is village, then fuel consumption is equal to town - village fual consumption.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.Town,
          destinationSettlement: Settlement.Village,
        ),
        DefaultRoadCommuteFuelConsumption.townVillage,
      ),
    );

    test(
      "if starting settlement is village and destination settlement is town, then fuel consumption is equal to town - village fual consumption.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.Village,
          destinationSettlement: Settlement.Town,
        ),
        DefaultRoadCommuteFuelConsumption.townVillage,
      ),
    );

    test(
      "if starting settlement is town and destination settlement is city, then fuel consumption is equal to town - city fual consumption.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.Town,
          destinationSettlement: Settlement.City,
        ),
        DefaultRoadCommuteFuelConsumption.townCity,
      ),
    );

    test(
      "if starting settlement is city and destination settlement is town, then fuel consumption is equal to town - city fual consumption.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.City,
          destinationSettlement: Settlement.Town,
        ),
        DefaultRoadCommuteFuelConsumption.townCity,
      ),
    );

    test(
      "if starting settlement is village and destination settlement is city, then fuel consumption is equal to city - village fual consumption.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.Village,
          destinationSettlement: Settlement.City,
        ),
        DefaultRoadCommuteFuelConsumption.cityVillage,
      ),
    );

    test(
      "if starting settlement is city and destination settlement is village, then fuel consumption is equal to city - village fual consumption.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.City,
          destinationSettlement: Settlement.Village,
        ),
        DefaultRoadCommuteFuelConsumption.cityVillage,
      ),
    );
  });
}
