import 'package:toplife/core/utils/chance.dart';

class StanceConstants {
  static bool getValidStanceValue({bool biggerChance = false}) {
    //default: 70 percent chance the stance is true
    //bigger chance: 90 percent chance the stance is true
    return (biggerChance)
        ? Chance.getTrueOrFalseBasedOnPercentageChance(
            trueChancePercentage: 90,
          )
        : Chance.getTrueOrFalseBasedOnPercentageChance(
            trueChancePercentage: 70,
          );
  }
}
