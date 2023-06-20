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

    test("defaultCurrencyTextInputFormatter is the correct value", () {
      expect(
        MoneyConstants.defaultCurrencyTextInputFormatter.symbol,
        "",
        reason: "Cause: Symbol",
      );
      expect(
        MoneyConstants.defaultCurrencyTextInputFormatter.decimalDigits,
        0,
        reason: "Cause: Decimal digits",
      );
    });
  });
}
