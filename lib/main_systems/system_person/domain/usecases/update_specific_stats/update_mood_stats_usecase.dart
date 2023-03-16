import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class UpdateMoodStatsUsecase {
  final StatsRepository _statsRepository;

  const UpdateMoodStatsUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int mainPersonID,
    required int change,
  }) async {
    final Stats? stats = await _statsRepository.getStats(mainPersonID);
    if (stats != null) {
      final int oldMood = stats.mood;
      _statsRepository.updateStats(
        stats.copyWith(
          mood: oldMood + change,
        ),
      );
    }
  }
}
