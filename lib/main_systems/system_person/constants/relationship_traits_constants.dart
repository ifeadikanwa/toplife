import 'dart:math';

import 'package:toplife/core/utils/chance.dart';

class RelationshipTraitsConstants {
  //* 1 -> always helps, 2 -> might help, 3 -> won't help
  static const possibleHelpfulness = [1, 2, 3];

  static int getValidHelpfulnessValue() {
    final randomIndex = Random().nextInt(possibleHelpfulness.length);
    return possibleHelpfulness[randomIndex];
  }

  static bool willProvideHelp({required int helpfulness}) {
    //* 1 -> always helps, 2 -> might help, 3 -> won't help
    switch (helpfulness) {
      case 1:
        return true;
      case 2:
        return Chance.getTrueOrFalse();
      case 3:
        return false;
      default:
        return false;
    }
  }

  static int getValidDaysToDateBeforeMarriage() {
    //return random value between 5 and 20
    return Random().nextInt(20) + 5;
  }

  static bool getValidEconomicalValue() {
    return Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: 70);
  }

  static bool getValidMaterialisticValue() {
    return Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: 20);
  }

  static bool getValidJealousValue() {
    return Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: 30);
  }

  static bool getValidCheaterValue() {
    return Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: 20);
  }
}
