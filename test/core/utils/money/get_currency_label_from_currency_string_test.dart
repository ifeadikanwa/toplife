import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/money/get_currency_label_from_currency_string.dart';

void main() {
  group("Get currency label from currency:", () {
    test(
      "when currency given is not null, return currency given",
      () {
        expect(getCurrencyLabelFromCurrencyString("£"), "£");
      },
    );

    test(
      "when currency given is null, return an empty string",
      () {
        expect(getCurrencyLabelFromCurrencyString(null), "");
      },
    );
  });
}
