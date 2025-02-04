import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/tattoo/tattoo_constants.dart';

void main() {
  group("Tattoo constants:", () {
    test("lowestTattooLocationBasePrice is 200", () {
      expect(
        TattooConstants.lowestTattooLocationBasePrice,
        200,
      );
    });

    test("lowestTattooSizeBasePrice is 300", () {
      expect(
        TattooConstants.lowestTattooSizeBasePrice,
        300,
      );
    });
  });
}
