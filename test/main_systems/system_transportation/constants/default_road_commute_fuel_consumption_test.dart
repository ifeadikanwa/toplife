import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/default_road_commute_fuel_consumption.dart';

void main() {
  group("Default Road Commute Fuel Consumption:", () {
    test(
      "max fuel fluctuator is 4",
      () => expect(DefaultRoadCommuteFuelConsumption.maxFuelFluctuator, 4),
    );

    test(
      "within village fuel consumption is 10",
      () => expect(DefaultRoadCommuteFuelConsumption.withinVillage, 10),
    );

    test(
      "within town fuel consumption is 15",
      () => expect(DefaultRoadCommuteFuelConsumption.withinTown, 15),
    );

    test(
      "within city fuel consumption is 20",
      () => expect(DefaultRoadCommuteFuelConsumption.withinCity, 20),
    );

    test(
      "town - city fuel consumption is 30",
      () => expect(DefaultRoadCommuteFuelConsumption.townCity, 30),
    );

    test(
      "town - village fuel consumption is 30",
      () => expect(DefaultRoadCommuteFuelConsumption.townVillage, 30),
    );

    test(
      "city - village fuel consumption is 40",
      () => expect(DefaultRoadCommuteFuelConsumption.cityVillage, 40),
    );
  });
}
