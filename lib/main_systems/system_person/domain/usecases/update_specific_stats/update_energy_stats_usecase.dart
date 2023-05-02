import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_deplete_stats_flag/toggle_deplete_stats_flag_usecase.dart';

class UpdateEnergyStatsUsecase {
  final StatsRepository _statsRepository;
  final ToggleDepleteStatsFlagUsecase _toggleDepleteStatsFlagUsecase;

  const UpdateEnergyStatsUsecase({
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
            energy: crossCheckStat(change),
          ),
        );
      } else {
        final int oldEnergy = stats.energy;

        await _statsRepository.updateStats(
          stats.copyWith(
            energy: crossCheckStat(oldEnergy + change),
          ),
        );
      }

      //tell system to not deplete the stat
      _toggleDepleteStatsFlagUsecase.execute(
        personID: mainPersonID,
        depleteEnergy: false,
      );
    }
  }
}
