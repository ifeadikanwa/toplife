import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/stats_repository.dart';

class UpdateIntellectStatsUsecase {
  final StatsRepository _statsRepository;

  const UpdateIntellectStatsUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int mainPersonID,
    required int change,
    required bool override,
  }) async {
    final Stats? stats = await _statsRepository.getStats(mainPersonID);

    if (stats != null) {
      if (override) {
        await _statsRepository.updateStats(
          stats.copyWith(
            intellect: change,
          ),
        );
      } else {
        final int oldIntellect = stats.intellect;
        await _statsRepository.updateStats(
          stats.copyWith(
            intellect: (oldIntellect + change),
          ),
        );
      }
    }
  }
}
