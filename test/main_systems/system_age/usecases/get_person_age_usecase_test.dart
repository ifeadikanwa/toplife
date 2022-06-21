import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/get_person_age_usecase.dart';

void main() {
  test("get person age usecase return correct age", () {
    Age result = GetPersonAgeUsecase().execute(
      birthday: 5,
      currentDay: 15,
    );

    const Age correctAge = Age(lifeStage: LifeStage.child, pointInStage: 3);

    expect(result, correctAge);
  });
}
