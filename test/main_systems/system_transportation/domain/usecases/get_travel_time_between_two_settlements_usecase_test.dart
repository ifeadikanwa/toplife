import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/default_road_travel_time.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/get_travel_time_between_two_settlements_usecase.dart';

void main() {
 group('Get travel time between two settlements usecase:', () {
    const usecase = GetTravelTimeBetweenTwoSettlementsUsecase();
    test(
      "if starting and destination settlement is village, then travel time is equal to within village time in minutes.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.Village,
          destinationSettlement: Settlement.Village,
        ),
        DefaultRoadTravelTime.withinVillageTimeInMinutes,
      ),
    );

    test(
      "if starting and destination settlement is town, then travel time is equal to within town time in minutes.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.Town,
          destinationSettlement: Settlement.Town,
        ),
        DefaultRoadTravelTime.withinTownTimeInMinutes,
      ),
    );

    test(
      "if starting and destination settlement is city, then travel time is equal to within city time in minutes.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.City,
          destinationSettlement: Settlement.City,
        ),
        DefaultRoadTravelTime.withinCityTimeInMinutes,
      ),
    );

    test(
      "if starting settlement is town and destination settlement is village, then travel time is equal to town - village time in minutes.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.Town,
          destinationSettlement: Settlement.Village,
        ),
        DefaultRoadTravelTime.townVillageTimeInMinutes,
      ),
    );

    test(
      "if starting settlement is village and destination settlement is town, then travel time is equal to town - village time in minutes.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.Village,
          destinationSettlement: Settlement.Town,
        ),
        DefaultRoadTravelTime.townVillageTimeInMinutes,
      ),
    );

    test(
      "if starting settlement is town and destination settlement is city, then travel time is equal to town - city time in minutes.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.Town,
          destinationSettlement: Settlement.City,
        ),
        DefaultRoadTravelTime.townCityTimeInMinutes,
      ),
    );

    test(
      "if starting settlement is city and destination settlement is town, then travel time is equal to town - city time in minutes.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.City,
          destinationSettlement: Settlement.Town,
        ),
        DefaultRoadTravelTime.townCityTimeInMinutes,
      ),
    );

    test(
      "if starting settlement is village and destination settlement is city, then travel time is equal to city - village time in minutes.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.Village,
          destinationSettlement: Settlement.City,
        ),
        DefaultRoadTravelTime.cityVillageTimeInMinutes,
      ),
    );

    test(
      "if starting settlement is city and destination settlement is village, then travel time is equal to city - village time in minutes.",
      () => expect(
        usecase.execute(
          startingSettlement: Settlement.City,
          destinationSettlement: Settlement.Village,
        ),
        DefaultRoadTravelTime.cityVillageTimeInMinutes,
      ),
    );
  });
}