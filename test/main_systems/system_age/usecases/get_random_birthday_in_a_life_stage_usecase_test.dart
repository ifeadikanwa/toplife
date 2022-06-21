import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/get_random_birthday_in_a_life_stage_usecase.dart';

void main() {
  test("get random birthday in a life stage usecase returns correct birthday",
      () {
    const int currentDay = 43;
    const LifeStage chosenLifeStage = LifeStage.teen;

    int result = GetRandomBirthdayInALifeStageUsecase().execute(
      lifeStage: chosenLifeStage,
      currentDay: currentDay,
    );

    Age ageBasedOnResult = Age.getAge(currentDay: currentDay, birthday: result);

    assert(
      ageBasedOnResult.lifeStage == chosenLifeStage
    );
  });
}
