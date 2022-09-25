import 'package:toplife/core/utils/numbers/get_negative_or_positive_multiplier.dart';
import 'package:toplife/core/utils/numbers/get_random_double_in_range.dart';

double flunctuateNumber({
  required double number,
  required int maxPercentage,
  required bool canBeNegativeFlunctuation,
}) {
  //the flunctuator takes the base number and gets x percent of it.
  //x is a random number in the range 0 - the maxPercentage given
  //if it can include negative fluctuation then we make the flunctuator negative or positive at random.
  final flunctuator = ((number *
          getRandomDoubleInRange(start: 0.0, end: (maxPercentage / 100))) *
      (canBeNegativeFlunctuation ? getNegativeOrPositiveMultiplier() : 1.0));

  final double flunctuatedNumber = number + flunctuator;

  return flunctuatedNumber;
}
