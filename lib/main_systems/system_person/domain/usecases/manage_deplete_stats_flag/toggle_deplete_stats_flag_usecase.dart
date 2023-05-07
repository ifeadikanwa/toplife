import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/main_systems/system_person/domain/repository/deplete_stats_flag_repository.dart';

class ToggleDepleteStatsFlagUsecase {
  final DepleteStatsFlagRepository _depleteStatsFlagRepository;

  const ToggleDepleteStatsFlagUsecase({
    required DepleteStatsFlagRepository depleteStatsFlagRepository,
  }) : _depleteStatsFlagRepository = depleteStatsFlagRepository;

  //the default behaviour is to deplete stats, we use this to take in request to NOT deplete particular stats
  Future<void> execute({
    required int personID,
    bool depleteEnergy = true,
    bool depleteHunger = true,
    bool depleteMood = true,
    bool depleteHealth = true,
    bool depleteAthleticism = true,
    bool alterSober = true,
  }) async {
    //get the current state of the persons flag
    //if there is no db record create a default flag
    DepleteStatsFlag currentDepleteStatsFlag =
        await _depleteStatsFlagRepository.getDepleteStatsFlag(personID) ??
            StatsConstants.defaultDepleteStatsFlag.copyWith(personId: personID);

    //update the current state with the request we get

    //We only update if we get an explicit request here to NOT deplete a stat.

    //We leave the rest unchanged from the current state
    //because they might have been flagged by someone else(but not processed yet)
    //and we don't want to mess with that

    if (depleteEnergy == false) {
      //we set to false
      currentDepleteStatsFlag = currentDepleteStatsFlag.copyWith(energy: false);
    }

    if (depleteHunger == false) {
      //we set to false
      currentDepleteStatsFlag = currentDepleteStatsFlag.copyWith(hunger: false);
    }

    if (depleteMood == false) {
      //we set to false
      currentDepleteStatsFlag = currentDepleteStatsFlag.copyWith(mood: false);
    }

    if (depleteHealth == false) {
      //we set to false
      currentDepleteStatsFlag = currentDepleteStatsFlag.copyWith(health: false);
    }

    if (depleteAthleticism == false) {
      //we set to false
      currentDepleteStatsFlag =
          currentDepleteStatsFlag.copyWith(athleticism: false);
    }

    if (alterSober == false) {
      //we set to false
      currentDepleteStatsFlag = currentDepleteStatsFlag.copyWith(sober: false);
    }

    //we save to the database
    await _depleteStatsFlagRepository
        .createOrUpdateDepleteStatsFlag(currentDepleteStatsFlag);
  }
}
