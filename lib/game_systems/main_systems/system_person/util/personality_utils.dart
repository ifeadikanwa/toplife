import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';

class PersonalityUtils {
  //the min chance that someone IS or IS NOT a personality trait is 70 and 10 respectively
  //if there is a 10% chance someone is forgiving they are most likely to NOT BE
  //if there is a 70% chance someone is forgiving they are most likely to BE
  static const int lessOfPersonalityChanceMinValue = 10;
  static const int moreOfPersonalityChanceMinValue = 70;

  //we fluctuate the min by a random number btw the fluctuator range
  static const int personalityChanceFluctuatorMin = 0;
  static const int personalityChanceFluctuatorMax = 20;

  static int getValidPersonalityValue() {
    //choose what end of the personality spectrum they are on
    final bool isMoreOfPersonality = Chance.getTrueOrFalse();

    //choose a random fluctuator
    final int fluctuation = getRandomIntInPositiveRange(
      min: personalityChanceFluctuatorMin,
      max: personalityChanceFluctuatorMax,
    );

    //return the appropriate min value + fluctuation
    final int basePersonalityChance = (isMoreOfPersonality)
        ? moreOfPersonalityChanceMinValue
        : lessOfPersonalityChanceMinValue;

    final int finalPersonalityChanceValue =
        (basePersonalityChance + fluctuation);

    return finalPersonalityChanceValue;
  }
}
