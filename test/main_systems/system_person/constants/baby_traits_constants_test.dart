import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/baby_traits_constants.dart';

void main() {
  group("Baby traits constants:", () {
    test("emergencyHungerLevel should be defined as 15", () {
      expect(BabyTraitsConstants.emergencyHungerLevel, 15);
    });

    test("emergencyHungerDepletion should be defined as 5", () {
      expect(BabyTraitsConstants.emergencyHungerDepletion, 5);
    });

    test("possibleFussiness values should be defined as this range", () {
      expect(BabyTraitsConstants.possibleFussiness, [10, 20, 30, 40, 50]);
    });

    test("possibleAppetite values should be defined as this range", () {
      expect(BabyTraitsConstants.possibleAppetite, [2, 3, 4]);
    });

    test(
        "getValidAppetiteValue values should return value in possibleAppetite range",
        () {
      assert(BabyTraitsConstants.possibleAppetite
          .contains(BabyTraitsConstants.getValidAppetiteValue()));
    });

    test(
        "getValidFussinessValue values should return value in possibleFussiness range",
        () {
      assert(BabyTraitsConstants.possibleFussiness
          .contains(BabyTraitsConstants.getValidFussinessValue()));
    });
  });
}
