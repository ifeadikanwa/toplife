import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_age/age_constants.dart';
import 'package:toplife/main_systems/system_age/usecases/get_day_of_birth_from_days_lived_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_day_of_next_birthday_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_persons_age_usecase.dart';

void main() {
  group("GetDayOfNextBirthdayUsecase: ", () {
    const GetDayOfNextBirthdayUsecase sut =
        GetDayOfNextBirthdayUsecase(GetPersonsAgeUsecase());

    const currentDay = 10;

    test("when person is a baby return day of their toddler birthday", () {
      final babyDayOfBirth = GetDayOfBirthFromDaysLivedUsecase().execute(
          currentDay: currentDay, daysLived: AgeConstants.babyMaxDaysLived - 2);

      final result =
          sut.execute(currentDay: currentDay, dayOfBirth: babyDayOfBirth);

      const correctDayOfNextBirthday = 13;

      expect(result, correctDayOfNextBirthday);
    });

    test("when person is a toddler return day of their child birthday", () {
      final toddlerDayOfBirth = GetDayOfBirthFromDaysLivedUsecase().execute(
          currentDay: currentDay,
          daysLived: AgeConstants.toddlerMaxDaysLived - 3);

      final result =
          sut.execute(currentDay: currentDay, dayOfBirth: toddlerDayOfBirth);

      const correctDayOfNextBirthday = 14;

      expect(result, correctDayOfNextBirthday);
    });

    test("when person is a child return day of their teen birthday", () {
      final childDayOfBirth = GetDayOfBirthFromDaysLivedUsecase().execute(
          currentDay: currentDay,
          daysLived: AgeConstants.childMaxDaysLived - 5);

      final result =
          sut.execute(currentDay: currentDay, dayOfBirth: childDayOfBirth);

      const correctDayOfNextBirthday = 16;

      expect(result, correctDayOfNextBirthday);
    });

    test("when person is a teen return day of their young adult birthday", () {
      final teenDayOfBirth = GetDayOfBirthFromDaysLivedUsecase().execute(
          currentDay: currentDay, daysLived: AgeConstants.teenMaxDaysLived - 5);

      final result =
          sut.execute(currentDay: currentDay, dayOfBirth: teenDayOfBirth);

      const correctDayOfNextBirthday = 16;

      expect(result, correctDayOfNextBirthday);
    });

    test("when person is a young adult return day of their adult birthday", () {
      final yaDayOfBirth = GetDayOfBirthFromDaysLivedUsecase().execute(
          currentDay: currentDay,
          daysLived: AgeConstants.youngAdultMaxDaysLived - 15);

      final result =
          sut.execute(currentDay: currentDay, dayOfBirth: yaDayOfBirth);

      const correctDayOfNextBirthday = 26;

      expect(result, correctDayOfNextBirthday);
    });

    test("when person is a adult return day of their elder birthday", () {
      final adultDayOfBirth = GetDayOfBirthFromDaysLivedUsecase().execute(
          currentDay: currentDay,
          daysLived: AgeConstants.adultMaxDaysLived - 10);

      final result =
          sut.execute(currentDay: currentDay, dayOfBirth: adultDayOfBirth);

      const correctDayOfNextBirthday = 21;

      expect(result, correctDayOfNextBirthday);
    });

    test("when person is a elder return null", () {
      final elderDayOfBirth = GetDayOfBirthFromDaysLivedUsecase().execute(
          currentDay: currentDay,
          daysLived: AgeConstants.elderMaxDaysLived - 2);

      final result =
          sut.execute(currentDay: currentDay, dayOfBirth: elderDayOfBirth);

      const correctDayOfNextBirthday = null;

      expect(result, correctDayOfNextBirthday);
    });
  });
}
