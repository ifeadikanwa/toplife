import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/money/get_currency_label_from_country_string.dart';

void main() {
  group("Get currency label from country:", () {
    test(
      "when given a country string return a currency with one character",
      () {
        expect(getCurrencyLabelFromCountryString("United States"), hasLength(1));
      },
    );
  });
}
