import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/person_stats.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/stats_constants.dart';

List<PersonStats> getListOfLowStats({
  required Stats stats,
}) {
  //
  final List<PersonStats> lowStats = [];
  //
  for (var personStat in PersonStats.values) {
    late final int statValue;

    //check
    switch (personStat) {
      case PersonStats.hunger:
        statValue = stats.hunger;
        break;
      case PersonStats.energy:
        statValue = stats.energy;
        break;
      case PersonStats.mood:
        statValue = stats.mood;
        break;
      case PersonStats.health:
        statValue = stats.health;
        break;
      case PersonStats.looks:
        statValue = stats.looks;
        break;
      case PersonStats.athleticism:
        statValue = stats.athleticism;
        break;
      case PersonStats.intellect:
        statValue = stats.intellect;
        break;
      case PersonStats.sober:
        statValue = stats.sober;
        break;
    }

    if (statValue <= StatsConstants.lowStatThreshold) {
      lowStats.add(personStat);
    }
  }

  return lowStats;
}
