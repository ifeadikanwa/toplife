import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/accident_constants.dart';

void main() {
  group("AccidentConstants:", () {
    test('defaultAccidentChance is 3', () {
      expect(
        AccidentConstants.defaultAccidentChance,
        3,
      );
    });

    test('maxLowEnergyStatAccidentChance is 20', () {
      expect(
        AccidentConstants.maxLowEnergyStatAccidentChance,
        20,
      );
    });

    test('minLowEnergyStatAccidentChance is 1', () {
      expect(
        AccidentConstants.minLowEnergyStatAccidentChance,
        1,
      );
    });

    test('maxLowSoberStatAccidentChance is 25', () {
      expect(
        AccidentConstants.maxLowSoberStatAccidentChance,
        25,
      );
    });

    test('minLowSoberStatAccidentChance is 1', () {
      expect(
        AccidentConstants.minLowSoberStatAccidentChance,
        1,
      );
    });

    test('minimumPossibleStats is 0', () {
      expect(
        AccidentConstants.minimumPossibleStats,
        0,
      );
    });

    test('accidentLowEnergyStatThreshold is 20', () {
      expect(
        AccidentConstants.accidentLowEnergyStatThreshold,
        20,
      );
    });

    test('accidentLowSoberStatThreshold is 50', () {
      expect(
        AccidentConstants.accidentLowSoberStatThreshold,
        50,
      );
    });
  });
}
