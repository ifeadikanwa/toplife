import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
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
      "energyDepletionRatePerHour is 5",
      () {
        expect(StatsConstants.energyDepletionRatePerHour, 5);
      },
    );

    test(
      "moodDepletionRatePerHour is 2",
      () {
        expect(StatsConstants.moodDepletionRatePerHour, 2);
      },
    );

    test(
      "healthDepletionRatePerHour is 0.2",
      () {
        expect(StatsConstants.healthDepletionRatePerHour, 0.2);
      },
    );

    test(
      "athleticismDepletionRatePerHour is 1",
      () {
        expect(StatsConstants.athleticismDepletionRatePerHour, 1);
      },
    );

    test(
      "soberIncreaseRatePerHour is 10",
      () {
        expect(StatsConstants.soberIncreaseRatePerHour, 10);
      },
    );

    test(
      "energyGainRatePerHour is 10",
      () {
        expect(StatsConstants.energyGainRatePerHour, 10);
      },
    );

    test(
      "maxEnergyForChanceToOversleep is 65",
      () {
        expect(StatsConstants.maxEnergyForChanceToOversleep, 65);
      },
    );

    test(
      "percentageChanceToOversleep is 20",
      () {
        expect(StatsConstants.percentageChanceToOversleep, 20);
      },
    );

    test(
      "healthDepletionThreshold is 65",
      () {
        expect(StatsConstants.healthDepletionThreshold, 65);
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
      "hungerEmergencyDepletionRatePerHour is 0.8",
      () {
        expect(StatsConstants.hungerEmergencyDepletionRatePerHour, 0.8);
      },
    );

    test(
      "energyEmergencyDepletionRatePerHour is 2",
      () {
        expect(StatsConstants.energyEmergencyDepletionRatePerHour, 2);
      },
    );

    test(
      "emergencyModeAthleticismSideEffectDepletionRatePerHour is 0.5",
      () {
        expect(
            StatsConstants
                .emergencyModeAthleticismSideEffectDepletionRatePerHour,
            0.5);
      },
    );

    test(
      "emergencyModeLooksSideEffectDepletionRatePerHour is 0.5",
      () {
        expect(StatsConstants.emergencyModeLooksSideEffectDepletionRatePerHour,
            0.5);
      },
    );

    test(
      "emergencyModeIntellectSideEffectDepletionRatePerHour is 0.5",
      () {
        expect(
            StatsConstants.emergencyModeIntellectSideEffectDepletionRatePerHour,
            0.5);
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
      "possibleSleepHoursInMinutes is correct",
      () {
        expect(
          StatsConstants.possibleSleepHoursInMinutes,
          [
            DurationTimeInMinutes.zero,
            DurationTimeInMinutes.oneHour,
            DurationTimeInMinutes.twoHours,
            DurationTimeInMinutes.threeHours,
            DurationTimeInMinutes.fourHours,
            DurationTimeInMinutes.fiveHours,
            DurationTimeInMinutes.sixHours,
            DurationTimeInMinutes.sevenHours,
            DurationTimeInMinutes.eightHours,
            DurationTimeInMinutes.nineHours,
            DurationTimeInMinutes.tenHours,
          ],
        );
      },
    );

    test(
      "possibleSleepMinutesInMinutes is correct",
      () {
        expect(
          StatsConstants.possibleSleepMinutesInMinutes,
          [
            DurationTimeInMinutes.zero,
            DurationTimeInMinutes.fiveMinutes,
            DurationTimeInMinutes.tenMinutes,
            DurationTimeInMinutes.fifteenMinutes,
            DurationTimeInMinutes.twentyMinutes,
            DurationTimeInMinutes.twentyFiveMinutes,
            DurationTimeInMinutes.thirtyMinutes,
            DurationTimeInMinutes.thirtyFiveMinutes,
            DurationTimeInMinutes.fortyMinutes,
            DurationTimeInMinutes.fortyFiveMinutes,
            DurationTimeInMinutes.fiftyMinutes,
            DurationTimeInMinutes.fiftyFiveMinutes,
          ],
        );
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
            sober: true,
          ),
        );
      },
    );
  });
}
