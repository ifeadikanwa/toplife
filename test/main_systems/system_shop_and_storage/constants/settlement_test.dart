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
  });
}
