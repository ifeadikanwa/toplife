import 'dart:math';

double getRandomDoubleInRange({required double start, required double end}) {
  return start + (end - start) * Random().nextDouble();
}
