import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class IncreaseMainPlayerSobernessUsecase {
  final StatsRepository _statsRepository;

  const IncreaseMainPlayerSobernessUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int personID,
    required double hours,
  }) async {
    final personStats = await _statsRepository.getStats(personID);

    if (personStats != null) {
      final double sobernessIncrease = hours * StatsConstants.soberIncreaseRatePerHour;

      final int updatedSoberness = (personStats.sober + sobernessIncrease).floor();

      final updatedPersonStats = personStats.copyWith(
        sober: crossCheckStat(updatedSoberness),
      );

      _statsRepository.updateStats(updatedPersonStats);
    }
  }
}
