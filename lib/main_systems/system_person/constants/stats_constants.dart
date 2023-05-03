import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/get_valid_random_stats_value.dart';

class StatsConstants {
  static const hungerDepletionRatePerHour = 10;
  static const energyDepletionRatePerHour = 5;
  static const moodDepletionRatePerHour = 2;
  static const athleticismDepletionRatePerHour = 1;
  static const healthDepletionRatePerHour = 0.2;

  static const soberIncreaseRatePerHour = 10;

  static const healthDepletionThreshold = 65;

  static const nonPlayerHungerDepletionRatePerHour = 8;

  static const babyEnergyDepletionRatePerHour = 10;

  static const hungerEmergencyDepletionRatePerHour = 0.8;
  static const energyEmergencyDepletionRatePerHour = 2;
  static const babyHungerEmergencyDepletionRatePerHour = 5;
  static const babyEnergyEmergencyDepletionRatePerHour = 1;

  static const hungerEmergencyModeStat = 20;
  static const energyEmergencyModeStat = 20;
  static const babyHungerEmergencyModeStat = 10;
  static const babyEnergyEmergencyModeStat = 10;

  //emergency mode side effects
  static const emergencyModeIntellectSideEffectDepletionRatePerHour = 0.5;
  static const emergencyModeLooksSideEffectDepletionRatePerHour = 0.5;
  static const emergencyModeAthleticismSideEffectDepletionRatePerHour = 0.5;

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
