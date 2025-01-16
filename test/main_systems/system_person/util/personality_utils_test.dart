import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/personality_utils.dart';

void main() {
  group("Personality Utils:", () {
    test(
      "lessOfPersonalityChanceMinValue is 10",
      () => expect(PersonalityUtils.lessOfPersonalityChanceMinValue, 10),
    );

    test(
      "moreOfPersonalityChanceMinValue is 70",
      () => expect(PersonalityUtils.moreOfPersonalityChanceMinValue, 70),
    );

    test(
      "personalityChanceFluctuatorMin is 0",
      () => expect(PersonalityUtils.personalityChanceFluctuatorMin, 0),
    );

    test(
      "personalityChanceFluctuatorMax is 20",
      () => expect(PersonalityUtils.personalityChanceFluctuatorMax, 20),
    );

    group("Get valid personality:", () {
      test("returns a value within the range 10 - 30 or 70 - 90", () {
        expect(
          PersonalityUtils.getValidPersonalityValue(),
          anyOf(
            inClosedOpenRange(10, 30),
            inClosedOpenRange(70, 90),
          ),
        );
      });
    });
  });
}
