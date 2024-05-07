import 'package:toplife/game_systems/main_systems/system_age/age.dart';
import 'package:toplife/game_systems/main_systems/system_age/age_constants.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';

class GetPersonsAgeUsecase {
  const GetPersonsAgeUsecase();

  Age execute({
    required int currentDay,
    required int dayOfBirth,
  }) {
    //get the days lived
    //from the days lived find out what stage of life they are in
    //find out how far into the stage they are
    //return Age object with the info

    //* Calculating pointInStageValue:
    //* pointInStageValue = stageDuration - (stageUpperLimit - daysLived)
    //* Example: in the range for a stage -> 4, 5, 6, 7 -> "5" is the 2nd point in the stage.
    //* To find that out we say stageDuration = 4 because we have 4 numbers in the stage.
    //* stageUpperLimit is 7 and daysLived is 5(the day whose position we are looking for)
    //*  4 - (7 - 5) = 4-2 = 2 -> 2nd point in the stage.

    final int daysLived = currentDay - dayOfBirth;

    //You are a baby
    if (daysLived <= AgeConstants.babyMaxDaysLived) {
      return Age(
        lifeStage: LifeStage.baby,
        pointInStage: daysLived,
      );
    }
    //You are a toddler
    else if (daysLived > AgeConstants.babyMaxDaysLived &&
        daysLived <= AgeConstants.toddlerMaxDaysLived) {
      final pointInStageValue = LifeStage.toddler.stageDuration -
          (AgeConstants.toddlerMaxDaysLived - daysLived);

      return Age(
        lifeStage: LifeStage.toddler,
        pointInStage: pointInStageValue,
      );
    }
    //You are a child
    else if (daysLived > AgeConstants.toddlerMaxDaysLived &&
        daysLived <= AgeConstants.childMaxDaysLived) {
      final pointInStageValue = LifeStage.child.stageDuration -
          (AgeConstants.childMaxDaysLived - daysLived);

      return Age(
        lifeStage: LifeStage.child,
        pointInStage: pointInStageValue,
      );
    }
    //You are a teen
    else if (daysLived > AgeConstants.childMaxDaysLived &&
        daysLived <= AgeConstants.teenMaxDaysLived) {
      final pointInStageValue = LifeStage.teen.stageDuration -
          (AgeConstants.teenMaxDaysLived - daysLived);

      return Age(
        lifeStage: LifeStage.teen,
        pointInStage: pointInStageValue,
      );
    }
    //You are a young adult
    else if (daysLived > AgeConstants.teenMaxDaysLived &&
        daysLived <= AgeConstants.youngAdultMaxDaysLived) {
      final pointInStageValue = LifeStage.youngAdult.stageDuration -
          (AgeConstants.youngAdultMaxDaysLived - daysLived);

      return Age(
        lifeStage: LifeStage.youngAdult,
        pointInStage: pointInStageValue,
      );
    }
    //You are an adult
    else if (daysLived > AgeConstants.youngAdultMaxDaysLived &&
        daysLived <= AgeConstants.adultMaxDaysLived) {
      final pointInStageValue = LifeStage.adult.stageDuration -
          (AgeConstants.adultMaxDaysLived - daysLived);

      return Age(
        lifeStage: LifeStage.adult,
        pointInStage: pointInStageValue,
      );
    }
    //You are an elder
    else {
      //Since elder age has no hard limit
      //we just need to get the days since you stopped being an adult.
      final pointInStageValue = daysLived - AgeConstants.adultMaxDaysLived;

      return Age(
        lifeStage: LifeStage.elder,
        pointInStage: pointInStageValue,
      );
    }
  }
}
