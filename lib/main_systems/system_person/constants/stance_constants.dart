import 'package:toplife/core/utils/chance.dart';

class StanceConstants{
  static bool getValidStanceValue() {
    //70 percent chance the stance is true
    return Chance.getTrueOrFalseBasedOnPercentageChance(
      trueChancePercentage: 70,
    );
  }
}