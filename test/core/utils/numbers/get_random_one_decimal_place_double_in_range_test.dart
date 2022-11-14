import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/numbers/get_random_one_decimal_place_double_in_range.dart';

void main() {
  group("Get random one decimal place double in range:", () {
    test(
      "returns random double in the range",
      () {
        expect(
          getRandomOneDecimalPlaceDoubleInRange(start: 7.0, end: 15.0),
          inInclusiveRange(7.0, 15.0),
        );
      },
    );

    test(
      "returns negative or positive random double in the range if given negative to positive number",
      () {
        final result = getRandomOneDecimalPlaceDoubleInRange(
          start: -10.0,
          end: 3.0,
        );
        expect(
          result,
          inInclusiveRange(-10.0, 3.0),
        );
      },
    );

    test(
      "returns negative random double in the range if given negative to negative number",
      () {
        final result = getRandomOneDecimalPlaceDoubleInRange(
          start: -10.0,
          end: -3.0,
        );
        expect(
          result,
          inInclusiveRange(-10.0, -3.0),
        );
      },
    );

    test(
      "if the start is greater than end it returns end value",
      () {
        final result =
            getRandomOneDecimalPlaceDoubleInRange(start: 10.0, end: 4.0);

        expect(
          result,
          4.0,
        );
      },
    );
  });
}
