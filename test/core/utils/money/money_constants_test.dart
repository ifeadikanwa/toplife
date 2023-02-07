import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/money/money_constants.dart';

void main() {
  group("Money constants:", () {
    test(
      "Money formatter locale is en_us",
      () {
        expect(MoneyConstants.moneyFormatterLocale, "en_us");
      },
    );
  });
}
