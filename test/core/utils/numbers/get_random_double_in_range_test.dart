import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/numbers/get_random_double_in_range.dart';

void main() {
  group("Get random double in range:", () {
    test(
      "in range 3.0 - 5.0 returns a double in that range",
      () {
        final result = getRandomDoubleInRange(start: 3.0, end: 5.0);

        expect(
          result,
          inInclusiveRange(
            3.0,
            5.0,
          ),
        );
      },
    );

    test(
      "in range 0.0 - 0.03 returns a double in that range",
      () {
        final result = getRandomDoubleInRange(start: 0.0, end: 0.03);

        expect(
          result,
          inInclusiveRange(
            0.0,
            0.03,
          ),
        );
      },
    );

    test(
      "in range 2.0 - (-5.0) returns a double in that range",
      () {
        final result = getRandomDoubleInRange(start: 2.0, end: -5.0);

        expect(
          result,
          inInclusiveRange(
            -5.0,
            2.0,
          ),
        );
      },
    );

    test(
      "in range (-4.0) - 3.0 returns a double in that range",
      () {
        final result = getRandomDoubleInRange(start: -4.0, end: 3.0);

        expect(
          result,
          inInclusiveRange(
            -4.0,
            3.0,
          ),
        );
      },
    );
  });
}
