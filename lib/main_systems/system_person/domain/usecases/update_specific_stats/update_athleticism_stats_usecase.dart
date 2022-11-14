import 'package:toplife/main_systems/system_person/domain/model/stats.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class UpdateAthleticismStatsUsecase {
  final StatsRepository _statsRepository;

  const UpdateAthleticismStatsUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int mainPersonID,
    required int change,
  }) async {
    final Stats? stats = await _statsRepository.getStats(mainPersonID);
    if (stats != null) {
      final int oldAthleticism = stats.athleticism;
      _statsRepository.updateStats(
        stats.copyWith(
          athleticism: oldAthleticism + change,
        ),
      );
    }
  }
}
