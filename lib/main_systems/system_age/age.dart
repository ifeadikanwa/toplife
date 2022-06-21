import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';

class Age extends Equatable {
  final LifeStage lifeStage;
  final int pointInStage;

  const Age({
    required this.lifeStage,
    required this.pointInStage,
  });

  @override
  List<Object?> get props => [
        lifeStage,
        pointInStage,
      ];

  @override
  bool? get stringify => true;

  //Age Limits
  static final babyAgeLimit = LifeStage.baby.stageDuration;
  static final toddlerAgeLimit = babyAgeLimit + LifeStage.toddler.stageDuration;
  static final childAgeLimit = toddlerAgeLimit + LifeStage.child.stageDuration;
  static final teenAgeLimit = childAgeLimit + LifeStage.teen.stageDuration;
  static final youngAdultAgeLimit =
      teenAgeLimit + LifeStage.youngAdult.stageDuration;
  static final adultAgeLimit =
      youngAdultAgeLimit + LifeStage.adult.stageDuration;

  static Age getAge({required int currentDay, required int birthday}) {
    //get the days lived
    //from the days lived find out what stage of life they are in
    //find out how far into the stage they are
    //return Age object with the info

    //* Calculating pointInStageValue:
    //* pointInStageValue = stageDuration - (stageUpperLimit - daysLived)
    //* Example: in the range for a stage -> 4, 5, 6, 7 -> "5" is the 2nd point in the stage.
    //* To find that out we say stageDuration = 4 because we have 4 numbers in the stage.
    //* stageUpperLimit is 7 and daysLived is 5(the day whose position we are looking for)
    //*  4 - (7 - 5) = 4-2 = 2 -> 2nd point in the stage.

    final int daysLived = currentDay - birthday;

    //You are a baby
    if (daysLived <= babyAgeLimit) {
      return Age(
        lifeStage: LifeStage.baby,
        pointInStage: daysLived,
      );
    }
    //You are a toddler
    else if (daysLived > babyAgeLimit && daysLived <= toddlerAgeLimit) {
      final pointInStageValue =
          LifeStage.toddler.stageDuration - (toddlerAgeLimit - daysLived);

      return Age(
        lifeStage: LifeStage.toddler,
        pointInStage: pointInStageValue,
      );
    }
    //You are a child
    else if (daysLived > toddlerAgeLimit && daysLived <= childAgeLimit) {
      final pointInStageValue =
          LifeStage.child.stageDuration - (childAgeLimit - daysLived);

      return Age(
        lifeStage: LifeStage.child,
        pointInStage: pointInStageValue,
      );
    }
    //You are a teen
    else if (daysLived > childAgeLimit && daysLived <= teenAgeLimit) {
      final pointInStageValue =
          LifeStage.teen.stageDuration - (teenAgeLimit - daysLived);

      return Age(
        lifeStage: LifeStage.teen,
        pointInStage: pointInStageValue,
      );
    }
    //You are a young adult
    else if (daysLived > teenAgeLimit && daysLived <= youngAdultAgeLimit) {
      final pointInStageValue =
          LifeStage.youngAdult.stageDuration - (youngAdultAgeLimit - daysLived);

      return Age(
        lifeStage: LifeStage.youngAdult,
        pointInStage: pointInStageValue,
      );
    }
    //You are an adult
    else if (daysLived > youngAdultAgeLimit && daysLived <= adultAgeLimit) {
      final pointInStageValue =
          LifeStage.adult.stageDuration - (adultAgeLimit - daysLived);

      return Age(
        lifeStage: LifeStage.adult,
        pointInStage: pointInStageValue,
      );
    }
    //You are an elder
    else {
      //Since elder age has no hard limit
      //we just need to get the days since you stopped being an adult.
      final pointInStageValue = daysLived - adultAgeLimit;

      return Age(
        lifeStage: LifeStage.elder,
        pointInStage: pointInStageValue,
      );
    }
  }

  //this generates a random age(days lived) in a stage that can be usd to create a birthday for a person
  static int getRandomDaysLivedForALifeStage({
    required LifeStage lifeStage,
    bool earlyStageInAge = false,
    bool lateStageInAge = false,
  }) {
    //check what life stage
    //get the range for that life stage
    //if earlyStage is true, divide the range in 2 and return a random value from the first half
    //if lateStage is true, divide the range in 2 and return value from secon half
    //else return a random value from the range

    switch (lifeStage) {
      case LifeStage.baby:
        if (earlyStageInAge) {
          return 0;
        } else if (lateStageInAge) {
          return babyAgeLimit;
        } else {
          return Random().nextInt(babyAgeLimit);
        }

      case LifeStage.toddler:
        final int lowestValue = babyAgeLimit + 1;
        final int highestValue = toddlerAgeLimit;

        return getValueInRange(
          getFromFirstHalf: earlyStageInAge,
          getFromSecondHalf: lateStageInAge,
          lowestValue: lowestValue,
          highestValue: highestValue,
        );

      case LifeStage.child:
        final int lowestValue = toddlerAgeLimit + 1;
        final int highestValue = childAgeLimit;

        return getValueInRange(
          getFromFirstHalf: earlyStageInAge,
          getFromSecondHalf: lateStageInAge,
          lowestValue: lowestValue,
          highestValue: highestValue,
        );

      case LifeStage.teen:
        final int lowestValue = childAgeLimit + 1;
        final int highestValue = teenAgeLimit;

        return getValueInRange(
          getFromFirstHalf: earlyStageInAge,
          getFromSecondHalf: lateStageInAge,
          lowestValue: lowestValue,
          highestValue: highestValue,
        );

      case LifeStage.youngAdult:
        final int lowestValue = teenAgeLimit + 1;
        final int highestValue = youngAdultAgeLimit;

        return getValueInRange(
          getFromFirstHalf: earlyStageInAge,
          getFromSecondHalf: lateStageInAge,
          lowestValue: lowestValue,
          highestValue: highestValue,
        );

      case LifeStage.adult:
        final int lowestValue = youngAdultAgeLimit + 1;
        final int highestValue = adultAgeLimit;

        return getValueInRange(
          getFromFirstHalf: earlyStageInAge,
          getFromSecondHalf: lateStageInAge,
          lowestValue: lowestValue,
          highestValue: highestValue,
        );

      case LifeStage.elder:
        final int lowestValue = adultAgeLimit + 1;
        final int highestValue =
            adultAgeLimit + LifeStage.elder.stageDuration ~/ 2;

        return getValueInRange(
          getFromFirstHalf: earlyStageInAge,
          getFromSecondHalf: lateStageInAge,
          lowestValue: lowestValue,
          highestValue: highestValue,
        );
    }
  }

  static int getValueInRange({
    required bool getFromFirstHalf,
    required bool getFromSecondHalf,
    required int lowestValue,
    required int highestValue,
  }) {
    final int full = highestValue - lowestValue;
    final int half = full ~/ 2;

    if (getFromFirstHalf) {
      return lowestValue + Random().nextInt(half);
    } else if (getFromSecondHalf) {
      return highestValue - Random().nextInt(half);
    } else {
      return lowestValue + Random().nextInt(full);
    }
  }

  static int getBirthDayFromDaysLived({
    required int currentDay,
    required int daysLived,
  }) {
    //get birthday so that age deduction will be consistent
    return currentDay - daysLived;
  }
}
