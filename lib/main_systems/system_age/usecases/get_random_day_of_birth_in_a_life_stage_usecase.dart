import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/get_day_of_birth_from_days_lived_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_random_days_lived_for_a_lifestage_usecase.dart';

class GetRandomDayOfBirthInALifeStageUsecase {
  final GetRandomDaysLivedInALifestage _getRandomDaysLivedInALifestage;
  final GetDayOfBirthFromDaysLivedUsecase _getDayOfBirthFromDaysLivedUsecase;

  const GetRandomDayOfBirthInALifeStageUsecase(
    this._getRandomDaysLivedInALifestage,
    this._getDayOfBirthFromDaysLivedUsecase,
  );

  int execute({
    required LifeStage lifeStage,
    required int currentDay,
    bool earlyStageInAge = false,
    bool lateStageInAge = false,
  }) {
    //get a random days lived in that life stage
    //deduce the birthday of that days lived

    int daysLived = _getRandomDaysLivedInALifestage.execute(
      lifeStage: lifeStage,
      earlyStageInAge: earlyStageInAge,
      lateStageInAge: lateStageInAge,
    );

    int dayOfBirth = _getDayOfBirthFromDaysLivedUsecase.execute(
      currentDay: currentDay,
      daysLived: daysLived,
    );

    return dayOfBirth;
  }
}
