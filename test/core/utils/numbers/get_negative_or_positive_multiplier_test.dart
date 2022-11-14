import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/numbers/get_negative_or_positive_multiplier.dart';

void main() {
  test(
    "getNegativeOrPositiveMultiplier return -1.0 or 1.0 only",
    () {
      expect(getNegativeOrPositiveMultiplier(), isIn([-1.0, 1.0]));
    },
  );
}
