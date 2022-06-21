import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/get_a_birthday_from_a_list_of_possible_life_stages_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_random_birthday_in_a_life_stage_usecase.dart';

void main() {
  group("GetABirthdayFromAListOfPossibleLifeStagesUsecase: ", () {
    late GetABirthdayFromAListOfPossibleLifeStagesUsecase sut;

    const currentDay = 20;

    setUp(() {
      sut = GetABirthdayFromAListOfPossibleLifeStagesUsecase(
          getRandomBirthdayInALifeStageUsecase:
              GetRandomBirthdayInALifeStageUsecase());
    });

    test("get birthday with no lifestage specified returns an adult's birthday",
        () {
      int birthdayResult = sut.execute(
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

      Age ageBasedOnBirthdayResult =
          Age.getAge(currentDay: currentDay, birthday: birthdayResult);

      expect(ageBasedOnBirthdayResult.lifeStage, LifeStage.adult);
    });

    test(
        "get birthday with only teen lifestage specified returns teen birthday",
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

      Age ageBasedOnBirthdayResult =
          Age.getAge(currentDay: currentDay, birthday: birthdayResult);

      expect(ageBasedOnBirthdayResult.lifeStage, LifeStage.teen);
    });

    test(
        "get birthday with multiple lifestages specified returns a birthday for ONE of those life stages",
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

      Age ageBasedOnBirthdayResult =
          Age.getAge(currentDay: currentDay, birthday: birthdayResult);

      final possibleLifeStages = [
        LifeStage.baby,
        LifeStage.child,
        LifeStage.youngAdult,
      ];

      assert(possibleLifeStages.contains(ageBasedOnBirthdayResult.lifeStage));
    });
  });
}
