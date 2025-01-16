import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/deplete_stats_flag_repository.dart';

class CreateOrUpdateDepleteStatsFlagUsecase {
  final DepleteStatsFlagRepository _depleteStatsFlagRepository;

  const CreateOrUpdateDepleteStatsFlagUsecase({
    required DepleteStatsFlagRepository depleteStatsFlagRepository,
  }) : _depleteStatsFlagRepository = depleteStatsFlagRepository;

  Future<void> execute(DepleteStatsFlag depleteStatsFlag) async {
    await _depleteStatsFlagRepository
        .createOrUpdateDepleteStatsFlag(depleteStatsFlag);
  }
}
