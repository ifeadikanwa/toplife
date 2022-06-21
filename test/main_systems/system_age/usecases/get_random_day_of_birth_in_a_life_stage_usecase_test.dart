import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/get_random_day_of_birth_in_a_life_stage_usecase.dart';

void main() {
  late GetRandomDayOfBirthInALifeStageUsecase sut;

  setUp(() {
    sut = GetRandomDayOfBirthInALifeStageUsecase();
  });

  test(
      "get random day of birth in a life stage usecase returns correct day of birth",
      () {
    const int currentDay = 43;
    const LifeStage chosenLifeStage = LifeStage.teen;

    int result = sut.execute(
      lifeStage: chosenLifeStage,
      currentDay: currentDay,
    );

    Age ageBasedOnResult =
        Age.getAge(currentDay: currentDay, dayOfBirth: result);

    assert(ageBasedOnResult.lifeStage == chosenLifeStage);
  });
}
