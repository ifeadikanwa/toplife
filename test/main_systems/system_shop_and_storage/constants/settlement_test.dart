import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';

void main() {
  group("Settllement:", () {
    test("village default commute is 2 hours", () {
      expect(Settlement.Village.defaultCommuteTimeInMinutes, 120);
    });

    test("town default commute is 1hr 30m", () {
      expect(Settlement.Town.defaultCommuteTimeInMinutes, 90);
    });

    test("city default commute is 1 hours", () {
      expect(Settlement.City.defaultCommuteTimeInMinutes, 60);
    });

    test("village default fuel consumption is 20", () {
      expect(Settlement.Village.defaultCommuteFuelConsumption, 20);
    });

    test("town default fuel consumption is 15", () {
      expect(Settlement.Town.defaultCommuteFuelConsumption, 15);
    });

    test("city default fuel consumption is 10", () {
      expect(Settlement.City.defaultCommuteFuelConsumption, 10);
    });
  });
}
