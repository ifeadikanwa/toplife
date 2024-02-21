import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';

void main() {
  group("Get random int in positive range:", () {
    test("if min or max is a negative number we get 0", () {
      expect(
        getRandomIntInPositiveRange(min: -8, max: 56),
        0,
        reason: "Cause: Min",
      );

      expect(
        getRandomIntInPositiveRange(min: 0, max: -45),
        0,
        reason: "Cause: Max",
      );
    });

    test('if min is greater than max we get 0', () {
      expect(
        getRandomIntInPositiveRange(min: 578, max: 230),
        0,
      );
    });

      test('if min is a positive number less than positive max, we get a random number between the range min to max', () {
      expect(
        getRandomIntInPositiveRange(min: 20, max: 140),
        inClosedOpenRange(20, 140),
      );
    });
  });
}
