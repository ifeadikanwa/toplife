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
  });
}
