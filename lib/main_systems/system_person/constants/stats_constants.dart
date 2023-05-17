import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
import 'package:toplife/core/utils/stats/get_valid_random_stats_value.dart';

class StatsConstants {
  //chance
  static const percentageChanceToOversleep = 20;

  //thresholds
  static const healthDepletionThreshold = 65;
  static const maxEnergyForChanceToOversleep = 65;

  //gain rates
  static const soberIncreaseRatePerHour = 10;
  static const energyGainRatePerHour = 10;

  //depletion rates
  static const hungerDepletionRatePerHour = 10;
  static const energyDepletionRatePerHour = 5;
  static const moodDepletionRatePerHour = 2;
  static const athleticismDepletionRatePerHour = 1;
  static const healthDepletionRatePerHour = 0.2;

  static const nonPlayerHungerDepletionRatePerHour = 8;

  static const babyEnergyDepletionRatePerHour = 10;

  static const hungerEmergencyDepletionRatePerHour = 0.8;
  static const energyEmergencyDepletionRatePerHour = 2;
  static const babyHungerEmergencyDepletionRatePerHour = 5;
  static const babyEnergyEmergencyDepletionRatePerHour = 1;

  //emergency modes
  static const hungerEmergencyModeStat = 20;
  static const energyEmergencyModeStat = 20;
  static const babyHungerEmergencyModeStat = 10;
  static const babyEnergyEmergencyModeStat = 10;

  //emergency mode side effects
  static const emergencyModeIntellectSideEffectDepletionRatePerHour = 0.5;
  static const emergencyModeLooksSideEffectDepletionRatePerHour = 0.5;
  static const emergencyModeAthleticismSideEffectDepletionRatePerHour = 0.5;

  //possible sleep times
  static const List<int> possibleSleepHoursInMinutes = [
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
  ];

  static const List<int> possibleSleepMinutesInMinutes = [
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
  ];

  static int getValidEnergyorHungerStatsValue() {
    return getValidRandomStatsValue(minValue: 50);
  }

  static const defaultDepleteStatsFlag = DepleteStatsFlag(
    personId: 0,
    energy: true,
    hunger: true,
    mood: true,
    health: true,
    athleticism: true,
    sober: true,
  );
}
