import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/default_road_travel_time.dart';

void main() {
  group("Default Road Travel Time:", () {
    test(
      "not possible time in minutes is 2880",
      () => expect(DefaultRoadTravelTime.notPossibleTimeInMinutes, 2880),
    );

    test(
      "within village time in minutes is 30",
      () => expect(DefaultRoadTravelTime.withinVillageTimeInMinutes, 30),
    );

    test(
      "within town time in minutes is 60",
      () => expect(DefaultRoadTravelTime.withinTownTimeInMinutes, 60),
    );

    test(
      "within city time in minutes is 90",
      () => expect(DefaultRoadTravelTime.withinCityTimeInMinutes, 90),
    );

    test(
      "town - city time in minutes is 120",
      () => expect(DefaultRoadTravelTime.townCityTimeInMinutes, 120),
    );

    test(
      "town - village time in minutes is 120",
      () => expect(DefaultRoadTravelTime.townVillageTimeInMinutes, 120),
    );

    test(
      "city - village time in minutes is 180",
      () => expect(DefaultRoadTravelTime.cityVillageTimeInMinutes, 180),
    );
  });
}
