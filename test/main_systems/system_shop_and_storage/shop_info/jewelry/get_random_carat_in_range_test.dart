import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/jewelry/utils/get_random_carat_in_range.dart';

void main() {
  group("Get Random Carat In Range:", () {
    test(
      "returns random double in the range",
      () {
        expect(
          getRandomCaratInRange(start: 2.0, end: 3.0),
          inInclusiveRange(2.0, 3.0),
        );
      },
    );

    test(
      "returns positive random double in the range if given negative number",
      () {
        final result = getRandomCaratInRange(start: -2.0, end: 3.0);

        expect(
          result,
          inInclusiveRange(2.0, 5.0),
        );
      },
    );

    test(
      "if the absolute of start is greater than end return end value",
      () {
        final result = getRandomCaratInRange(start: -5.0, end: 3.0);

        expect(
          result,
          3.0,
        );
      },
    );
  });
}
