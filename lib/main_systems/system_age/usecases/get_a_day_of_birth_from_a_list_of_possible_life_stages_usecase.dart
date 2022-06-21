import 'dart:math';

import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/get_random_day_of_birth_in_a_life_stage_usecase.dart';

class GetADayOfBirthFromAListOfPossibleLifeStagesUsecase {
  final GetRandomDayOfBirthInALifeStageUsecase
      _getRandomDayOfBirthInALifeStageUsecase;

  const GetADayOfBirthFromAListOfPossibleLifeStagesUsecase(
      {required GetRandomDayOfBirthInALifeStageUsecase
          getRandomDayOfBirthInALifeStageUsecase})
      : _getRandomDayOfBirthInALifeStageUsecase =
            getRandomDayOfBirthInALifeStageUsecase;

  int execute({
    required int currentDay,
    required bool earlyStageInAge,
    required bool lateStageInAge,
    required bool canBeBaby,
    required bool canBeToddler,
    required bool canBeChild,
    required bool canBeTeen,
    required bool canBeYoungAdult,
    required bool canBeAdult,
    required bool canBeElder,
  }) {
    //put all the possibities in an list
    //if the list length is 0, add the default age
    //get a random index within the range of the list length.
    //generate a dayOfBirth from the lifestage at the the random index
    //return that dayOfBirth

    final List<LifeStage> possibleLifeStages = [];

    if (canBeBaby) {
      possibleLifeStages.add(LifeStage.baby);
    }
    if (canBeToddler) {
      possibleLifeStages.add(LifeStage.toddler);
    }
    if (canBeChild) {
      possibleLifeStages.add(LifeStage.child);
    }
    if (canBeTeen) {
      possibleLifeStages.add(LifeStage.teen);
    }
    if (canBeYoungAdult) {
      possibleLifeStages.add(LifeStage.youngAdult);
    }
    if (canBeAdult) {
      possibleLifeStages.add(LifeStage.adult);
    }
    if (canBeElder) {
      possibleLifeStages.add(LifeStage.elder);
    }

    if (possibleLifeStages.isEmpty) {
      LifeStage defaultLifeStage = LifeStage.adult;
      possibleLifeStages.add(defaultLifeStage);
    }

    int randomIndex = Random().nextInt(possibleLifeStages.length);

    LifeStage chosenLifeStage = possibleLifeStages[randomIndex];

    int dayOfBirth = _getRandomDayOfBirthInALifeStageUsecase.execute(
        lifeStage: chosenLifeStage,
        currentDay: currentDay,
        earlyStageInAge: earlyStageInAge,
        lateStageInAge: lateStageInAge);

    return dayOfBirth;
  }
}
