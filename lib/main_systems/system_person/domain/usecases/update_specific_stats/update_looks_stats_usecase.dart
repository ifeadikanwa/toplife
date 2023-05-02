import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
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
        _statsRepository.updateStats(
          stats.copyWith(
            looks: crossCheckStat(change),
          ),
        );
      } else {
        final int oldLooks = stats.looks;
        _statsRepository.updateStats(
          stats.copyWith(
            looks: crossCheckStat(oldLooks + change),
          ),
        );
      }
    }
  }
}
