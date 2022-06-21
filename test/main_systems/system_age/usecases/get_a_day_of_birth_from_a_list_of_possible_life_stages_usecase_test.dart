import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/get_a_day_of_birth_from_a_list_of_possible_life_stages_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_random_day_of_birth_in_a_life_stage_usecase.dart';

void main() {
  group("GetADayOfBirthFromAListOfPossibleLifeStagesUsecase: ", () {
    late GetADayOfBirthFromAListOfPossibleLifeStagesUsecase sut;

    const currentDay = 20;

    setUp(() {
      sut = GetADayOfBirthFromAListOfPossibleLifeStagesUsecase(
          getRandomDayOfBirthInALifeStageUsecase:
              GetRandomDayOfBirthInALifeStageUsecase());
    });

    test("when no lifestage is specified return an adult's birthday", () {
      int dayOfBirthResult = sut.execute(
        currentDay: currentDay,
        earlyStageInAge: false,
        lateStageInAge: false,
        canBeBaby: false,
        canBeToddler: false,
        canBeChild: false,
        canBeTeen: false,
        canBeYoungAdult: false,
        canBeAdult: false,
        canBeElder: false,
      );

      Age ageBasedOnDayOfBirthResult =
          Age.getAge(currentDay: currentDay, dayOfBirth: dayOfBirthResult);

      expect(ageBasedOnDayOfBirthResult.lifeStage, LifeStage.adult);
    });

    test("when only teen lifestage is specified returns a teen day of birth",
        () {
      int birthdayResult = sut.execute(
        currentDay: currentDay,
        earlyStageInAge: false,
        lateStageInAge: false,
        canBeBaby: false,
        canBeToddler: false,
        canBeChild: false,
        canBeTeen: true,
        canBeYoungAdult: false,
        canBeAdult: false,
        canBeElder: false,
      );

      Age ageBasedOnDayOfBirthResult =
          Age.getAge(currentDay: currentDay, dayOfBirth: birthdayResult);

      expect(ageBasedOnDayOfBirthResult.lifeStage, LifeStage.teen);
    });

    test(
        "when multiple lifestages are specified return a day of birth for ONE of those life stages",
        () {
      int birthdayResult = sut.execute(
        currentDay: currentDay,
        earlyStageInAge: false,
        lateStageInAge: false,
        canBeBaby: true,
        canBeToddler: false,
        canBeChild: true,
        canBeTeen: false,
        canBeYoungAdult: true,
        canBeAdult: false,
        canBeElder: false,
      );

      Age ageBasedOnDayOfBirthResult =
          Age.getAge(currentDay: currentDay, dayOfBirth: birthdayResult);

      final possibleLifeStages = [
        LifeStage.baby,
        LifeStage.child,
        LifeStage.youngAdult,
      ];

      assert(possibleLifeStages.contains(ageBasedOnDayOfBirthResult.lifeStage));
    });
  });
}
