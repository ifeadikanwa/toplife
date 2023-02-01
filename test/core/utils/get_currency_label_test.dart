import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/get_currency_label.dart';

void main() {
  group("Get currency label:", () {
    test(
      "when currency given is not null, return currency given",
      () {
        expect(getCurrencyLabel("£"), "£");
      },
    );

      test(
      "when currency given is null, return an empty string",
      () {
        expect(getCurrencyLabel(null), "");
      },
    );
  });
}
