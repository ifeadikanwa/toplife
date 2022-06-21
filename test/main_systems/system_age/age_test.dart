import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';

void main() {
  group("Age: ", () {
    group("Age Limits: ", () {
      test("babyAgeLimit is equal to baby life stage duration", () {
        expect(
          Age.babyAgeLimit,
          LifeStage.baby.stageDuration,
        );
      });

      test("toddlerAgeLimit is equal to baby + toddler life stage duration",
          () {
        expect(
          Age.toddlerAgeLimit,
          LifeStage.baby.stageDuration + LifeStage.toddler.stageDuration,
        );
      });

      test(
          "childAgeLimit is equal to baby + toddler + child life stage duration",
          () {
        expect(
          Age.childAgeLimit,
          LifeStage.baby.stageDuration +
              LifeStage.toddler.stageDuration +
              LifeStage.child.stageDuration,
        );
      });

      test(
          "teenAgeLimit is equal to baby + toddler + child + teen life stage duration",
          () {
        expect(
          Age.teenAgeLimit,
          LifeStage.baby.stageDuration +
              LifeStage.toddler.stageDuration +
              LifeStage.child.stageDuration +
              LifeStage.teen.stageDuration,
        );
      });

      test(
          "youngAdultAgeLimit is equal to baby + toddler + child + teen + youngAdult life stage duration",
          () {
        expect(
          Age.youngAdultAgeLimit,
          LifeStage.baby.stageDuration +
              LifeStage.toddler.stageDuration +
              LifeStage.child.stageDuration +
              LifeStage.teen.stageDuration +
              LifeStage.youngAdult.stageDuration,
        );
      });

      test(
          "adultAgeLimit is equal to baby + toddler + child + teen + youngAdult + adult life stage duration",
          () {
        expect(
          Age.adultAgeLimit,
          LifeStage.baby.stageDuration +
              LifeStage.toddler.stageDuration +
              LifeStage.child.stageDuration +
              LifeStage.teen.stageDuration +
              LifeStage.youngAdult.stageDuration +
              LifeStage.adult.stageDuration,
        );
      });
    });

    group("getBirthDayFromDaysLived: ", () {
      test(
          "getBirthDayFromDaysLived returns -10 as birthday if you've lived 20 days and the current day is 10",
          () {
        expect(
          Age.getBirthDayFromDaysLived(currentDay: 10, daysLived: 20),
          -10,
        );
      });
    });

    group("getValueInRange: ", () {
      test("getValueInRange returns value in first half of range if asked to",
          () {
        final result = Age.getValueInRange(
          getFromFirstHalf: true,
          getFromSecondHalf: false,
          lowestValue: 20,
          highestValue: 30,
        );

        const possibleValues = [20, 21, 22, 23, 24];

        assert(possibleValues.contains(result));
      });

      test("getValueInRange returns value in second half of range if asked to",
          () {
        final result = Age.getValueInRange(
          getFromFirstHalf: false,
          getFromSecondHalf: true,
          lowestValue: 20,
          highestValue: 30,
        );

        const possibleValues = [26, 27, 28, 29, 30];

        assert(possibleValues.contains(result));
      });

      test(
          "getValueInRange returns any value in range if no constraints are specified",
          () {
        final result = Age.getValueInRange(
          getFromFirstHalf: false,
          getFromSecondHalf: false,
          lowestValue: 20,
          highestValue: 30,
        );

        const possibleValues = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29];

        assert(possibleValues.contains(result));
      });
    });

    group("getRandomDaysLivedForALifeStage: ", () {
      test(
          "returns days within the baby age limit when asked for baby life stage",
          () {
        final result = Age.getRandomDaysLivedForALifeStage(
          lifeStage: LifeStage.baby,
        );

        assert(result <= Age.babyAgeLimit);
      });

      test("returns 0 when asked for baby in early life stage", () {
        final result = Age.getRandomDaysLivedForALifeStage(
          lifeStage: LifeStage.baby,
          earlyStageInAge: true,
        );

        expect(result, 0);
      });

      test(
          "returns baby life stage duration when asked for baby in late life stage",
          () {
        final result = Age.getRandomDaysLivedForALifeStage(
          lifeStage: LifeStage.baby,
          lateStageInAge: true,
        );

        expect(result, LifeStage.baby.stageDuration);
      });

      test(
          "returns days within the toddler age limit when asked for toddler life stage",
          () {
        final result = Age.getRandomDaysLivedForALifeStage(
          lifeStage: LifeStage.toddler,
        );

        assert(result > Age.babyAgeLimit && result <= Age.toddlerAgeLimit);
      });

      test(
          "returns days within the first half of toddler age limit when asked for early toddler life stage",
          () {
        final result = Age.getRandomDaysLivedForALifeStage(
          lifeStage: LifeStage.toddler,
          earlyStageInAge: true,
        );

        assert(result > Age.babyAgeLimit &&
            result <=
                (Age.toddlerAgeLimit - (LifeStage.toddler.stageDuration ~/ 2)));
      });

      test(
          "returns days within the child age limit when asked for child life stage",
          () {
        final result = Age.getRandomDaysLivedForALifeStage(
          lifeStage: LifeStage.child,
        );

        assert(result > Age.toddlerAgeLimit && result <= Age.childAgeLimit);
      });

      test(
          "returns days within the second half of child age limit when asked for late child life stage",
          () {
        final result = Age.getRandomDaysLivedForALifeStage(
          lifeStage: LifeStage.child,
          lateStageInAge: true,
        );

        assert(result >
                (Age.toddlerAgeLimit + (LifeStage.child.stageDuration ~/ 2)) &&
            result <= Age.childAgeLimit);
      });

      test(
          "returns days within the teen age limit when asked for teen life stage",
          () {
        final result = Age.getRandomDaysLivedForALifeStage(
          lifeStage: LifeStage.teen,
        );

        assert(result > Age.childAgeLimit && result <= Age.teenAgeLimit);
      });

      test(
          "returns days within the young adult age limit when asked for young adult life stage",
          () {
        final result = Age.getRandomDaysLivedForALifeStage(
          lifeStage: LifeStage.youngAdult,
        );

        assert(result > Age.teenAgeLimit && result <= Age.youngAdultAgeLimit);
      });

      test(
          "returns days within the adult age limit when asked for adult life stage",
          () {
        final result = Age.getRandomDaysLivedForALifeStage(
          lifeStage: LifeStage.adult,
        );

        assert(result > Age.youngAdultAgeLimit && result <= Age.adultAgeLimit);
      });

      test(
          "returns days within half the elder age limit when asked for elder life stage",
          () {
        final result = Age.getRandomDaysLivedForALifeStage(
          lifeStage: LifeStage.elder,
        );

        assert(result > Age.adultAgeLimit &&
            result <=
                (Age.adultAgeLimit + (LifeStage.elder.stageDuration ~/ 2)));
      });
    });

    group("getAge: ", () {
      const currentDay = 10;
      test("if person is within the baby age range we get correct baby age",
          () {
        const babyBirthday = 10;

        final result = Age.getAge(
          currentDay: currentDay,
          birthday: babyBirthday,
        );

        const correctAge = Age(lifeStage: LifeStage.baby, pointInStage: 0);

        expect(result, correctAge);
      });

      test(
          "if person is within the toddler age range we get correct toddler age",
          () {
        const toddlerBirthday = 4;

        final result = Age.getAge(
          currentDay: currentDay,
          birthday: toddlerBirthday,
        );

        const correctAge = Age(lifeStage: LifeStage.toddler, pointInStage: 3);

        expect(result, correctAge);
      });

      test("if person is within the child age range we get correct child age",
          () {
        const childBirthday = 0;

        final result = Age.getAge(
          currentDay: currentDay,
          birthday: childBirthday,
        );

        const correctAge = Age(lifeStage: LifeStage.child, pointInStage: 3);

        expect(result, correctAge);
      });

      test("if person is within the teen age range we get correct teen age",
          () {
        const teenBirthday = -9;

        final result = Age.getAge(
          currentDay: currentDay,
          birthday: teenBirthday,
        );

        const correctAge = Age(lifeStage: LifeStage.teen, pointInStage: 6);

        expect(result, correctAge);
      });

      test(
          "if person is within the young adult age range we get correct young adult age",
          () {
        const youngAdultBirthday = -21;

        final result = Age.getAge(
          currentDay: currentDay,
          birthday: youngAdultBirthday,
        );

        const correctAge =
            Age(lifeStage: LifeStage.youngAdult, pointInStage: 12);

        expect(result, correctAge);
      });

      test("if person is within the adult age range we get correct adult age",
          () {
        const adultBirthday = -49;

        final result = Age.getAge(
          currentDay: currentDay,
          birthday: adultBirthday,
        );

        const correctAge = Age(lifeStage: LifeStage.adult, pointInStage: 10);

        expect(result, correctAge);
      });

      test("if person is within the elder age range we get correct elder age",
          () {
        const elderBirthday = -84;

        final result = Age.getAge(
          currentDay: currentDay,
          birthday: elderBirthday,
        );

        const correctAge = Age(lifeStage: LifeStage.elder, pointInStage: 15);

        expect(result, correctAge);
      });
    });
  });
}
