import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/default_road_travel_time.dart';

void main() {
  group("Default Road Travel Time:", () {
    test(
      "not possible time in minutes is 2880",
      () => expect(DefaultRoadTravelTime.notPossibleTimeInMinutes, 2880),
    );

    test(
      "within village time in minutes is 60",
      () => expect(DefaultRoadTravelTime.withinVillageTimeInMinutes, 60),
    );

    test(
      "within town time in minutes is 45",
      () => expect(DefaultRoadTravelTime.withinTownTimeInMinutes, 45),
    );

    test(
      "within city time in minutes is 30",
      () => expect(DefaultRoadTravelTime.withinCityTimeInMinutes, 30),
    );

    test(
      "town - city time in minutes is 60",
      () => expect(DefaultRoadTravelTime.townCityTimeInMinutes, 60),
    );

    test(
      "town - village time in minutes is 60",
      () => expect(DefaultRoadTravelTime.townVillageTimeInMinutes, 60),
    );

    test("city - village time in minutes is 120",
        () => expect(DefaultRoadTravelTime.cityVillageTimeInMinutes, 120));
  });
}
