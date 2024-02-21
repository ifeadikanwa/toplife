import 'dart:math';

int getRandomIntInPositiveRange({
  required int min,
  required int max,
}) {
  if ((min > max) ||
      (min == 0 && max == 0) ||
      min.isNegative ||
      max.isNegative) {
    return 0;
  } else {
    return Random().nextInt(max - min) + min;
  }
}
