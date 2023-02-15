import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class UpdateSoberStatsUsecase {
  final StatsRepository _statsRepository;

  const UpdateSoberStatsUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int mainPersonID,
    required int change,
  }) async {
    final Stats? stats = await _statsRepository.getStats(mainPersonID);
    if (stats != null) {
      final int oldSober = stats.sober;
      _statsRepository.updateStats(
        stats.copyWith(
          sober: oldSober + change,
        ),
      );
    }
  }
}
