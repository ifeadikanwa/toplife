import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/constants/stats_constants.dart';

void main() {
  group("Stats constants:", () {
    test(
      "hungerDepletionRatePerHour is 10",
      () {
        expect(StatsConstants.hungerDepletionRatePerHour, 10);
      },
    );

    test(
      "energyDepletionRatePerHour is 7",
      () {
        expect(StatsConstants.energyDepletionRatePerHour, 7);
      },
    );

    test(
      "nonPlayerHungerDepletionRatePerHour is 8",
      () {
        expect(StatsConstants.nonPlayerHungerDepletionRatePerHour, 8);
      },
    );

    test(
      "babyEnergyDepletionRatePerHour is 10",
      () {
        expect(StatsConstants.babyEnergyDepletionRatePerHour, 10);
      },
    );

    test(
      "hungerEmergencyDepletionRatePerHour is 1",
      () {
        expect(StatsConstants.hungerEmergencyDepletionRatePerHour, 1);
      },
    );

    test(
      "energyEmergencyDepletionRatePerHour is 2",
      () {
        expect(StatsConstants.energyEmergencyDepletionRatePerHour, 2);
      },
    );

    test(
      "babyHungerEmergencyDepletionRatePerHour is 5",
      () {
        expect(StatsConstants.babyHungerEmergencyDepletionRatePerHour, 5);
      },
    );

    test(
      "babyEnergyEmergencyDepletionRatePerHour is 1",
      () {
        expect(StatsConstants.babyEnergyEmergencyDepletionRatePerHour, 1);
      },
    );

    test(
      "hungerEmergencyModeStat is 20",
      () {
        expect(StatsConstants.hungerEmergencyModeStat, 20);
      },
    );

    test(
      "energyEmergencyModeStat is 20",
      () {
        expect(StatsConstants.energyEmergencyModeStat, 20);
      },
    );

    test(
      "babyEnergyEmergencyModeStat is 10",
      () {
        expect(StatsConstants.babyEnergyEmergencyModeStat, 10);
      },
    );

    test(
      "babyHungerEmergencyModeStat is 10",
      () {
        expect(StatsConstants.babyHungerEmergencyModeStat, 10);
      },
    );

    test(
      "getValidEnergyorHungerStatsValue return a number in the range 50 - 100",
      () {
        expect(
          StatsConstants.getValidEnergyorHungerStatsValue(),
          inInclusiveRange(50, 100),
        );
      },
    );

    test(
      "defaultDepleteStatsFlag is correct",
      () {
        expect(
          StatsConstants.defaultDepleteStatsFlag,
          const DepleteStatsFlag(
            personId: 0,
            energy: true,
            hunger: true,
            mood: true,
            health: true,
            athleticism: true,
          ),
        );
      },
    );
  });
}
