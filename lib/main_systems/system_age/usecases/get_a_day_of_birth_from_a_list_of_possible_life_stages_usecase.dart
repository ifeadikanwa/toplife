import 'dart:math';

import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/get_random_day_of_birth_in_a_life_stage_usecase.dart';

class GetADayOfBirthFromAListOfPossibleLifeStagesUsecase {
  final GetRandomDayOfBirthInALifeStageUsecase
      _getRandomDayOfBirthInALifeStageUsecase;

  const GetADayOfBirthFromAListOfPossibleLifeStagesUsecase({
    required GetRandomDayOfBirthInALifeStageUsecase
        getRandomDayOfBirthInALifeStageUsecase,
  }) : _getRandomDayOfBirthInALifeStageUsecase =
            getRandomDayOfBirthInALifeStageUsecase;

  int execute({
    required int currentDay,
    required bool earlyStageInAge,
    required bool lateStageInAge,
    required List<LifeStage> possibleLifeStages,
  }) {
    //if the list length is 0, add the default age
    //get a random index within the range of the list length.
    //generate a dayOfBirth from the lifestage at the the random index
    //return that dayOfBirth
    final List<LifeStage> finalPossibleLifeStages = [];

    if (possibleLifeStages.isEmpty) {
      LifeStage defaultLifeStage = LifeStage.adult;
      finalPossibleLifeStages.add(defaultLifeStage);
    } else {
      finalPossibleLifeStages.addAll(possibleLifeStages);
    }

    int randomIndex = Random().nextInt(finalPossibleLifeStages.length);

    LifeStage chosenLifeStage = finalPossibleLifeStages[randomIndex];

    int dayOfBirth = _getRandomDayOfBirthInALifeStageUsecase.execute(
      lifeStage: chosenLifeStage,
      currentDay: currentDay,
      earlyStageInAge: earlyStageInAge,
      lateStageInAge: lateStageInAge,
    );

    return dayOfBirth;
  }
}
