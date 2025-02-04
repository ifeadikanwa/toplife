import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/deplete_stats_flag_repository.dart';

class ResetDepleteStatsFlagUsecase {
  final DepleteStatsFlagRepository _depleteStatsFlagRepository;

  const ResetDepleteStatsFlagUsecase({
    required DepleteStatsFlagRepository depleteStatsFlagRepository,
  }) : _depleteStatsFlagRepository = depleteStatsFlagRepository;

  Future<void> execute(int personID) async {
    //use the default flag values but override the person id
    final DepleteStatsFlag resetDepleteStatsFlag =
        StatsConstants.defaultDepleteStatsFlag.copyWith(
      personId: personID,
    );

    //create new or update existing record
    await _depleteStatsFlagRepository
        .createOrUpdateDepleteStatsFlag(resetDepleteStatsFlag);
  }
}
