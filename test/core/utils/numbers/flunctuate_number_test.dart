import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/numbers/flunctuate_number.dart';

void main() {
  group("Flunctuate number:", () {
    test(
      "returns number in the range (((-maxPercentage/100) * number) + number) -> (((maxPercentage/100) * number) + number) when canBeNegativeFlunctuation = true",
      () {
        const double num = 450;
        const int maxPercentage = 6;

        const lowestPossibleValue = ((-maxPercentage / 100) * num) + num;
        const highestPossibleValue = ((maxPercentage / 100) * num) + num;

        final result = flunctuateNumber(
          number: num,
          maxPercentage: maxPercentage,
          canBeNegativeFlunctuation: true,
        );

        expect(
          result,
          inInclusiveRange(
            lowestPossibleValue,
            highestPossibleValue,
          ),
        );
      },
    );

    test(
      "returns number in the range: number -> (((maxPercentage/100) * number) + number) when canBeNegativeFlunctuation = false",
      () {
        const double num = 450;
        const int maxPercentage = 6;

        const lowestPossibleValue = ((0) * num) + num;
        const highestPossibleValue = ((maxPercentage / 100) * num) + num;

        final result = flunctuateNumber(
          number: num,
          maxPercentage: maxPercentage,
          canBeNegativeFlunctuation: false,
        );

        expect(
          result,
          inInclusiveRange(
            lowestPossibleValue,
            highestPossibleValue,
          ),
        );
      },
    );
  });
}
