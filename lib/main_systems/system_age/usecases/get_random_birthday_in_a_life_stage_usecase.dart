import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';

class GetRandomBirthdayInALifeStageUsecase {
  int execute({
    required LifeStage lifeStage,
    required int currentDay,
    bool earlyStageInAge = false,
    bool lateStageInAge = false,
  }) {
    //get a random days lived in that life stage
    //deduce the birthday of that days lived

    int daysLived = Age.getRandomDaysLivedForALifeStage(
      lifeStage: lifeStage,
      earlyStageInAge: earlyStageInAge,
      lateStageInAge: lateStageInAge,
    );

    int birthday = Age.getBirthDayFromDaysLived(
      currentDay: currentDay,
      daysLived: daysLived,
    );

    return birthday;
  }
}
