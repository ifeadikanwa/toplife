import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/deplete_stats_flag_repository.dart';

class GetPersonDepleteStatsFlagUsecase {
  final DepleteStatsFlagRepository _depleteStatsFlagRepository;

  const GetPersonDepleteStatsFlagUsecase({
    required DepleteStatsFlagRepository depleteStatsFlagRepository,
  }) : _depleteStatsFlagRepository = depleteStatsFlagRepository;

  Future<DepleteStatsFlag?> execute({required int personID}) async {
    final DepleteStatsFlag? depleteStatsFlag =
        await _depleteStatsFlagRepository.getDepleteStatsFlag(personID);

    return depleteStatsFlag;
  }
}
