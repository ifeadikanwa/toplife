import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/piercing/piercing_constants.dart';

void main() {
  group("Piercing constants:", () {
    test("lowest piercing base price is 100", () {
      expect(
        PiercingConstants.lowestPiercingBasePrice,
        100,
      );
    });

    test("piercing duration in minutes is 60", () {
      expect(
        PiercingConstants.piercingDurationInMinutes,
        60,
      );
    });
  });
}
