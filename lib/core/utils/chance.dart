import 'dart:math';

class Chance {
  static bool getTrueOrFalse() {
    return Random().nextBool();
  }

  static bool getTrueOrFalseBasedOnPercentageChance(
      {required int trueChancePercentage}) {
    //get a random number between 1 and 100
    final randomNumber = Random().nextInt(101) + 1;

    //* if randomNumber is within the range 1 - trueChancePercentage then return true
    return randomNumber <= trueChancePercentage;
  }
}
