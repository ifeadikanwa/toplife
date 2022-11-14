import 'dart:math';

double getRandomDoubleInRange({required double start, required double end}) {
  return Random().nextDouble() * (end - start) + start;
}
