import 'dart:math';

double getRandomOneDecimalPlaceDoubleInRange({
  required double start,
  required double end,
}) {
  //round start and end to 1 d.p
  const int decimalPlaces = 1;
  final double roundedStart =
      double.parse(start.toStringAsFixed(decimalPlaces));

  final double roundedEnd = double.parse(end.toStringAsFixed(decimalPlaces));

  //bad range error control
  if (roundedStart >= roundedEnd) {
    return roundedEnd;
  }

  //find out how many 0.1's are in the range
  const double incrementValue = 0.1;
  final int numOfIncrementValueInRange =
      (roundedEnd - roundedStart + incrementValue) ~/ incrementValue;

  //get a random number between 0 and numOfIncrementValueInRange
  final int randomNumber = Random().nextInt(numOfIncrementValueInRange);

  //create a 1 d.p double with the random number
  final randomDouble = (randomNumber * incrementValue) + roundedStart;

  return double.parse(randomDouble.toStringAsFixed(decimalPlaces));
}
