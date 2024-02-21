import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_age/age_constants.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/check_if_person_is_at_least_this_age_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_persons_days_lived_usecase.dart';

void main() {
  group("CheckIfPersonIsAtLeastThisAgeUsecase: ", () {
    //sut
    const CheckIfPersonIsAtLeastThisAgeUsecase
        checkIfPersonIsAtLeastThisAgeUsecase =
        CheckIfPersonIsAtLeastThisAgeUsecase(
      GetPersonsDaysLivedUsecase(),
    );

    //variables
    const int currentDay = 300;
    //get day of birth for every lifestage using the current day
    const int babyDayOfBirth = currentDay - (AgeConstants.newBabyDaysLived);

    final int toddlerDayOfBirth =
        currentDay - (AgeConstants.newToddlerDaysLived);
    final int childDayOfBirth = currentDay - (AgeConstants.newChildDaysLived);

    final int teenDayOfBirth = currentDay - (AgeConstants.newTeenDaysLived);
    final int youngAdultDayOfBirth =
        currentDay - (AgeConstants.newYoungAdultDaysLived);

    final int adultDayOfBirth = currentDay - (AgeConstants.newAdultDaysLived);

    final int elderDayOfBirth = currentDay - (AgeConstants.newElderDaysLived);

    //helper function
    int getDayOfBirth(LifeStage lifestage) {
      switch (lifestage) {
        case LifeStage.baby:
          return babyDayOfBirth;
        case LifeStage.toddler:
          return toddlerDayOfBirth;
        case LifeStage.child:
          return childDayOfBirth;
        case LifeStage.teen:
          return teenDayOfBirth;
        case LifeStage.youngAdult:
          return youngAdultDayOfBirth;
        case LifeStage.adult:
          return adultDayOfBirth;
        case LifeStage.elder:
          return elderDayOfBirth;
      }
    }

    test(
        "if the query age is elder, elder returns true and every lifestage before it will give us false",
        () {
      const LifeStage queryAge = LifeStage.elder;

      for (var lifestage in LifeStage.values) {
        final bool result = checkIfPersonIsAtLeastThisAgeUsecase.execute(
          currentDay: currentDay,
          dayOfBirth: getDayOfBirth(lifestage),
          age: queryAge,
        );
        if (lifestage == LifeStage.elder) {
          expect(
            result,
            true,
            reason: "Cause: ${lifestage.name}",
          );
        } else {
          expect(
            result,
            false,
            reason: "Cause: ${lifestage.name}",
          );
        }
      }
    });

    test(
        "if the query age is adult, elder and adult returns true and every lifestage before it will give us false",
        () {
      const LifeStage queryAge = LifeStage.adult;

      for (var lifestage in LifeStage.values) {
        final bool result = checkIfPersonIsAtLeastThisAgeUsecase.execute(
          currentDay: currentDay,
          dayOfBirth: getDayOfBirth(lifestage),
          age: queryAge,
        );
        if (lifestage == LifeStage.adult || lifestage == LifeStage.elder) {
          expect(
            result,
            true,
            reason: "Cause: ${lifestage.name}",
          );
        } else {
          expect(
            result,
            false,
            reason: "Cause: ${lifestage.name}",
          );
        }
      }
    });

    test(
        "if the query age is young adult, elder, adult and young adult returns true and every lifestage before it will give us false",
        () {
      const LifeStage queryAge = LifeStage.youngAdult;

      for (var lifestage in LifeStage.values) {
        final bool result = checkIfPersonIsAtLeastThisAgeUsecase.execute(
          currentDay: currentDay,
          dayOfBirth: getDayOfBirth(lifestage),
          age: queryAge,
        );
        if (lifestage == LifeStage.youngAdult ||
            lifestage == LifeStage.adult ||
            lifestage == LifeStage.elder) {
          expect(
            result,
            true,
            reason: "Cause: ${lifestage.name}",
          );
        } else {
          expect(
            result,
            false,
            reason: "Cause: ${lifestage.name}",
          );
        }
      }
    });

    test(
        "if the query age is teen, elder, adult, young adult and teen returns true and every lifestage before it will give us false",
        () {
      const LifeStage queryAge = LifeStage.teen;

      for (var lifestage in LifeStage.values) {
        final bool result = checkIfPersonIsAtLeastThisAgeUsecase.execute(
          currentDay: currentDay,
          dayOfBirth: getDayOfBirth(lifestage),
          age: queryAge,
        );
        if (lifestage == LifeStage.teen ||
            lifestage == LifeStage.youngAdult ||
            lifestage == LifeStage.youngAdult ||
            lifestage == LifeStage.adult ||
            lifestage == LifeStage.elder) {
          expect(
            result,
            true,
            reason: "Cause: ${lifestage.name}",
          );
        } else {
          expect(
            result,
            false,
            reason: "Cause: ${lifestage.name}",
          );
        }
      }
    });

    test(
        "if the query age is child, elder, adult, young adult, teen and child returns true and every lifestage before it will give us false",
        () {
      const LifeStage queryAge = LifeStage.child;

      for (var lifestage in LifeStage.values) {
        final bool result = checkIfPersonIsAtLeastThisAgeUsecase.execute(
          currentDay: currentDay,
          dayOfBirth: getDayOfBirth(lifestage),
          age: queryAge,
        );
        if (lifestage == LifeStage.child ||
            lifestage == LifeStage.teen ||
            lifestage == LifeStage.youngAdult ||
            lifestage == LifeStage.youngAdult ||
            lifestage == LifeStage.adult ||
            lifestage == LifeStage.elder) {
          expect(
            result,
            true,
            reason: "Cause: ${lifestage.name}",
          );
        } else {
          expect(
            result,
            false,
            reason: "Cause: ${lifestage.name}",
          );
        }
      }
    });

    test(
        "if the query age is toddler, elder, adult, young adult, teen, child and toddler returns true and every lifestage before it will give us false",
        () {
      const LifeStage queryAge = LifeStage.toddler;

      for (var lifestage in LifeStage.values) {
        final bool result = checkIfPersonIsAtLeastThisAgeUsecase.execute(
          currentDay: currentDay,
          dayOfBirth: getDayOfBirth(lifestage),
          age: queryAge,
        );
        if (lifestage == LifeStage.toddler ||
            lifestage == LifeStage.child ||
            lifestage == LifeStage.teen ||
            lifestage == LifeStage.youngAdult ||
            lifestage == LifeStage.youngAdult ||
            lifestage == LifeStage.adult ||
            lifestage == LifeStage.elder) {
          expect(
            result,
            true,
            reason: "Cause: ${lifestage.name}",
          );
        } else {
          expect(
            result,
            false,
            reason: "Cause: ${lifestage.name}",
          );
        }
      }
    });

    test(
        "if the query age is baby, elder, adult, young adult, teen, child, toddler and baby returns true and every lifestage before it will give us false",
        () {
      const LifeStage queryAge = LifeStage.baby;

      for (var lifestage in LifeStage.values) {
        final bool result = checkIfPersonIsAtLeastThisAgeUsecase.execute(
          currentDay: currentDay,
          dayOfBirth: getDayOfBirth(lifestage),
          age: queryAge,
        );
        if (lifestage == LifeStage.baby ||
            lifestage == LifeStage.toddler ||
            lifestage == LifeStage.child ||
            lifestage == LifeStage.teen ||
            lifestage == LifeStage.youngAdult ||
            lifestage == LifeStage.youngAdult ||
            lifestage == LifeStage.adult ||
            lifestage == LifeStage.elder) {
          expect(
            result,
            true,
            reason: "Cause: ${lifestage.name}",
          );
        } else {
          expect(
            result,
            false,
            reason: "Cause: ${lifestage.name}",
          );
        }
      }
    });
  });
}
