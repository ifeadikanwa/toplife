import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/get_valid_random_stats_value.dart';
import 'package:toplife/main_systems/system_person/constants/stats_constants.dart';

class GenerateStatsUsecase {
  Stats execute({
    required int personID,
  }) {
    return Stats(
      id: DatabaseConstants.dummyId,
      personId: personID,
      energy: StatsConstants.getValidEnergyorHungerStatsValue(),
      hunger: StatsConstants.getValidEnergyorHungerStatsValue(),
      mood: getValidRandomStatsValue(),
      health: defaultMaxStatsValue,
      sober: defaultMaxStatsValue,
      looks: getValidRandomStatsValue(),
      intellect: getValidRandomStatsValue(),
      athleticism: getValidRandomStatsValue(),
      alcoholTolerance: StatsConstants.getValidAlcoholToleranceStatsValue(),
    );
  }
}
