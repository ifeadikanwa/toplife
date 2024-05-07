import 'package:toplife/game_systems/main_systems/system_person/domain/repository/deplete_stats_flag_repository.dart';

class DeletePersonDepleteStatsFlagUsecase {
  final DepleteStatsFlagRepository _depleteStatsFlagRepository;

  const DeletePersonDepleteStatsFlagUsecase({
    required DepleteStatsFlagRepository depleteStatsFlagRepository,
  }) : _depleteStatsFlagRepository = depleteStatsFlagRepository;

  Future<void> execute({required int personID}) async {
    await _depleteStatsFlagRepository.deleteDepleteStatsFlag(personID);
  }
}
