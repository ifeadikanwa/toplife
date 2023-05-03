import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class DecayAndAlterPlayerStatsUsecase {
  final PersonUsecases _personUsecases;

  const DecayAndAlterPlayerStatsUsecase(this._personUsecases);

  //Everything to manipulating the players stats based on time progression in the game
  Future<void> execute({
    required int playerID,
    required double hoursPassed,
  }) async {
    //get the player deplete stats flag
    final DepleteStatsFlag? depleteStatsFlag =
        await _personUsecases.getPersonDepleteStatsFlagUsecase.execute(
      personID: playerID,
    );

    //If there is no deplete stats flag record for the player:
    //assume there is NO request to NOT deplete/alter the stats

    // If there is a deplete stats flag record for the player:
    //we use the flags to determine which stat to alter
    //true means we deplete/alter, false is a request to not deplete/alter

    //energy
    if (depleteStatsFlag == null || depleteStatsFlag.energy) {
      await _personUsecases.depleteMainPlayerEnergyUsecase.execute(
        personID: playerID,
        hours: hoursPassed,
      );
    }

    //hunger
    if (depleteStatsFlag == null || depleteStatsFlag.hunger) {
      await _personUsecases.depleteMainPlayerHungerUsecase.execute(
        personID: playerID,
        hours: hoursPassed,
      );
    }

    //health
    if (depleteStatsFlag == null || depleteStatsFlag.health) {
      await _personUsecases.depleteMainPlayerHealthUsecase.execute(
        personID: playerID,
        hours: hoursPassed,
      );
    }

    //mood
    if (depleteStatsFlag == null || depleteStatsFlag.mood) {
      await _personUsecases.depleteMainPlayerMoodUsecase.execute(
        personID: playerID,
        hours: hoursPassed,
      );
    }

    //athleticism
    if (depleteStatsFlag == null || depleteStatsFlag.athleticism) {
      await _personUsecases.depleteMainPlayerAthleticismUsecase.execute(
        personID: playerID,
        hours: hoursPassed,
      );
    }

    //sober
    //in retrospect I should have named this class alter stats flag but I didnt
    //Anyways take this to basically means "alter sober?" because we increase not decrease the sober stat with time
    if (depleteStatsFlag == null || depleteStatsFlag.sober) {
      await _personUsecases.increaseMainPlayerSobernessUsecase.execute(
        personID: playerID,
        hours: hoursPassed,
      );
    }

    //reset flags
    _personUsecases.resetDepleteStatsFlagUsecase.execute(playerID);
  }
}
