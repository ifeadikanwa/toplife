import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class UpdateSoberStatsUsecase {
  final StatsRepository _statsRepository;

  const UpdateSoberStatsUsecase({
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
            sober: crossCheckStat(change),
          ),
        );
      } else {
        final int oldSober = stats.sober;

        _statsRepository.updateStats(
          stats.copyWith(
            sober: crossCheckStat(oldSober + change),
          ),
        );
      }
    }
  }
}
