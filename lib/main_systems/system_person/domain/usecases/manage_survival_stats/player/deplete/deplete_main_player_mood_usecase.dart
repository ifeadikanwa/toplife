import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class DepleteMainPlayerMoodUsecase {
  final StatsRepository _statsRepository;

  const DepleteMainPlayerMoodUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int personID,
    required double hours,
  }) async {
    final personStats = await _statsRepository.getStats(personID);
    if (personStats != null) {
      final double depletedMood = hours * StatsConstants.moodDepletionRatePerHour;

      final int updatedMood = (personStats.mood - depletedMood).floor();

      final updatedPersonStats = personStats.copyWith(
        mood: crossCheckStat(updatedMood),
      );

      _statsRepository.updateStats(updatedPersonStats);
    }
  }
}
