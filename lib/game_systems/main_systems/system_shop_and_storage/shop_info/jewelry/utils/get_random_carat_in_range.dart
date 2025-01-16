//returns random 1 d.p double in range

import 'package:toplife/core/utils/numbers/get_random_one_decimal_place_double_in_range.dart';

double getRandomCaratInRange({required double start, required double end}) {
  //carat cannot be negative
  return getRandomOneDecimalPlaceDoubleInRange(
    start: start.abs(),
    end: end.abs(),
  );
}
