import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class MoneyConstants {
  static const moneyFormatterLocale = "en_us";
  static final CurrencyTextInputFormatter defaultCurrencyTextInputFormatter =
      CurrencyTextInputFormatter(
    symbol: "",
    decimalDigits: 0,
  );
}
