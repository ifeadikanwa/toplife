import 'package:intl/intl.dart';
import 'package:toplife/core/utils/money/money_constants.dart';

String formatMoneyToString(int money) {
  final NumberFormat moneyFormatter =
      NumberFormat.decimalPattern(MoneyConstants.moneyFormatterLocale);

  return moneyFormatter.format(money);
}
