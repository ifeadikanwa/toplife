import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_age/age.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_a_day_of_birth_from_a_list_of_possible_life_stages_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_day_of_birth_from_days_lived_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_days_lived_range_for_a_lifestage_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_persons_age_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_random_day_of_birth_in_a_life_stage_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_random_days_lived_for_a_lifestage_usecase.dart';

void main() {
  group("GetADayOfBirthFromAListOfPossibleLifeStagesUsecase: ", () {
    late GetADayOfBirthFromAListOfPossibleLifeStagesUsecase sut;

    const currentDay = 20;

    setUp(() {
      sut = GetADayOfBirthFromAListOfPossibleLifeStagesUsecase(
        getRandomDayOfBirthInALifeStageUsecase:
            GetRandomDayOfBirthInALifeStageUsecase(
          const GetRandomDaysLivedInALifestage(
            GetDaysLivedRangeForALifestageUsecase(),
          ),
          GetDayOfBirthFromDaysLivedUsecase(),
        ),
      );
    });

    test("when no lifestage is specified return an adult's birthday", () {
      int dayOfBirthResult = sut.execute(
        currentDay: currentDay,
        earlyStageInAge: false,
        lateStageInAge: false,
        possibleLifeStages: [],
      );

      Age ageBasedOnDayOfBirthResult = const GetPersonsAgeUsecase()
          .execute(currentDay: currentDay, dayOfBirth: dayOfBirthResult);

      expect(ageBasedOnDayOfBirthResult.lifeStage, LifeStage.adult);
    });

    test("when only teen lifestage is specified returns a teen day of birth",
        () {
      int birthdayResult = sut.execute(
        currentDay: currentDay,
        earlyStageInAge: false,
        lateStageInAge: false,
        possibleLifeStages: [LifeStage.teen],
      );

      Age ageBasedOnDayOfBirthResult = const GetPersonsAgeUsecase()
          .execute(currentDay: currentDay, dayOfBirth: birthdayResult);

      expect(ageBasedOnDayOfBirthResult.lifeStage, LifeStage.teen);
    });

    test(
        "when multiple lifestages are specified return a day of birth for ONE of those life stages",
        () {
      final possibleLifeStages = [
        LifeStage.baby,
        LifeStage.child,
        LifeStage.youngAdult,
      ];
      int birthdayResult = sut.execute(
        currentDay: currentDay,
        earlyStageInAge: false,
        lateStageInAge: false,
        possibleLifeStages: possibleLifeStages,
      );

      Age ageBasedOnDayOfBirthResult = const GetPersonsAgeUsecase()
          .execute(currentDay: currentDay, dayOfBirth: birthdayResult);

      assert(possibleLifeStages.contains(ageBasedOnDayOfBirthResult.lifeStage));
    });
  });
}
