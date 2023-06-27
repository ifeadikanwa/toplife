import 'package:toplife/core/utils/chance.dart';

class StanceUtils {
  static const int defaultChanceValue = 70;
  static const int biggerChanceValue = 90;
  
  static bool getValidStanceValue({bool biggerChance = false}) {
    //default: 70 percent chance the stance is true
    //bigger chance: 90 percent chance the stance is true
    return (biggerChance)
        ? Chance.getTrueOrFalseBasedOnPercentageChance(
            trueChancePercentage: defaultChanceValue,
          )
        : Chance.getTrueOrFalseBasedOnPercentageChance(
            trueChancePercentage: biggerChanceValue,
          );
  }
}
