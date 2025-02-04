import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/stats_repository.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_deplete_stats_flag/toggle_deplete_stats_flag_usecase.dart';

class UpdateMoodStatsUsecase {
  final StatsRepository _statsRepository;
  final ToggleDepleteStatsFlagUsecase _toggleDepleteStatsFlagUsecase;

  const UpdateMoodStatsUsecase({
    required StatsRepository statsRepository,
    required ToggleDepleteStatsFlagUsecase toggleDepleteStatsFlagUsecase,
  })  : _statsRepository = statsRepository,
        _toggleDepleteStatsFlagUsecase = toggleDepleteStatsFlagUsecase;

  Future<void> execute({
    required int mainPersonID,
    required int change,
    required bool override,
  }) async {
    final Stats? stats = await _statsRepository.getStats(mainPersonID);

    if (stats != null) {
      //update the stat
      if (override) {
        await _statsRepository.updateStats(
          stats.copyWith(
            mood: change,
          ),
        );
      } else {
        final int oldMood = stats.mood;

        await _statsRepository.updateStats(
          stats.copyWith(
            mood: (oldMood + change),
          ),
        );
      }

      //tell system to not deplete the stat
      await _toggleDepleteStatsFlagUsecase.execute(
        personID: mainPersonID,
        depleteMood: false,
      );
    }
  }
}
