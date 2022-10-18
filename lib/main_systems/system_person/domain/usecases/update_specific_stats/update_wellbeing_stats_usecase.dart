import 'package:toplife/main_systems/system_person/domain/model/stats.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class UpdateWellbeingStatsUsecase {
  final StatsRepository _statsRepository;

  const UpdateWellbeingStatsUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int mainPersonID,
    required int change,
  }) async {
    final Stats? stats = await _statsRepository.getStats(mainPersonID);
    if (stats != null) {
      final int oldWellbeing = stats.wellbeing;
      _statsRepository.updateStats(
        stats.copyWith(
          wellbeing: oldWellbeing + change,
        ),
      );
    }
  }
}
