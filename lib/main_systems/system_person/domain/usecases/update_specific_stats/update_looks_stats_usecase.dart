import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class UpdateLooksStatsUsecase {
  final StatsRepository _statsRepository;

  const UpdateLooksStatsUsecase({
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
            looks: change,
          ),
        );
      } else {
        final int oldLooks = stats.looks;
        await _statsRepository.updateStats(
          stats.copyWith(
            looks: (oldLooks + change),
          ),
        );
      }
    }
  }
}
