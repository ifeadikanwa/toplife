import 'dart:math';

int getValueInSpecificPartOfRange({
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
