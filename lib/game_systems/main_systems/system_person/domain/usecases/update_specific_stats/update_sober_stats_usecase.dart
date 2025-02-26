import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/stats_repository.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_deplete_stats_flag/toggle_deplete_stats_flag_usecase.dart';

class UpdateSoberStatsUsecase {
  final StatsRepository _statsRepository;
  final ToggleDepleteStatsFlagUsecase _toggleDepleteStatsFlagUsecase;

  const UpdateSoberStatsUsecase({
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
      if (override) {
        await _statsRepository.updateStats(
          stats.copyWith(
            sober: change,
          ),
        );
      } else {
        final int oldSober = stats.sober;

        await _statsRepository.updateStats(
          stats.copyWith(
            sober: (oldSober + change),
          ),
        );
      }

      //tell system to not alter the stat
      await _toggleDepleteStatsFlagUsecase.execute(
        personID: mainPersonID,
        alterSober: false,
      );
    }
  }
}
