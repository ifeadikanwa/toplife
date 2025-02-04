import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_age/age.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_persons_age_usecase.dart';

void main() {
  const GetPersonsAgeUsecase sut = GetPersonsAgeUsecase();
  const currentDay = 10;

  test("if person is within the baby age range we get correct baby age", () {
    const babyDayOfBirth = 10;

    final result = sut.execute(
      currentDay: currentDay,
      dayOfBirth: babyDayOfBirth,
    );

    const correctAge = Age(lifeStage: LifeStage.baby, pointInStage: 0);

    expect(result, correctAge);
  });

  test("if person is within the toddler age range we get correct toddler age",
      () {
    const toddlerDayOfBirth = 0;

    final result = sut.execute(
      currentDay: currentDay,
      dayOfBirth: toddlerDayOfBirth,
    );

    const correctAge = Age(lifeStage: LifeStage.toddler, pointInStage: 3);

    expect(result, correctAge);
  });

  test("if person is within the child age range we get correct child age", () {
    const childDayOfBirth = -7;

    final result = sut.execute(
      currentDay: currentDay,
      dayOfBirth: childDayOfBirth,
    );

    const correctAge = Age(lifeStage: LifeStage.child, pointInStage: 3);

    expect(result, correctAge);
  });

  test("if person is within the teen age range we get correct teen age", () {
    const teenDayOfBirth = -29;

    final result = sut.execute(
      currentDay: currentDay,
      dayOfBirth: teenDayOfBirth,
    );

    const correctAge = Age(lifeStage: LifeStage.teen, pointInStage: 11);

    expect(result, correctAge);
  });

  test(
      "if person is within the young adult age range we get correct young adult age",
      () {
    const youngAdultDayOfBirth = -45;

    final result = sut.execute(
      currentDay: currentDay,
      dayOfBirth: youngAdultDayOfBirth,
    );

    const correctAge = Age(lifeStage: LifeStage.youngAdult, pointInStage: 6);

    expect(result, correctAge);
  });

  test("if person is within the adult age range we get correct adult age", () {
    const adultDayOfBirth = -83;

    final result = sut.execute(
      currentDay: currentDay,
      dayOfBirth: adultDayOfBirth,
    );

    const correctAge = Age(lifeStage: LifeStage.adult, pointInStage: 2);

    expect(result, correctAge);
  });

  test("if person is within the elder age range we get correct elder age", () {
    const elderDayOfBirth = -182;

    final result = sut.execute(
      currentDay: currentDay,
      dayOfBirth: elderDayOfBirth,
    );

    const correctAge = Age(lifeStage: LifeStage.elder, pointInStage: 38);

    expect(result, correctAge);
  });
}
