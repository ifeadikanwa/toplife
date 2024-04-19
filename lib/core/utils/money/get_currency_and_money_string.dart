import 'package:toplife/core/utils/money/format_money_to_string.dart';
import 'package:toplife/core/utils/money/get_currency_label_from_country_string.dart';
import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';

String getCurrencyAndMoneyString({
  required String country,
  required int? amount,
  required bool adjustToEconomy,
}) {
  //get the country currency
  final String currency = getCurrencyLabelFromCountryString(country);

  //get the final amount after necessary adjustments
  late final int finalAmount;
  if (amount == null) {
    finalAmount = 0;
  } else if (adjustToEconomy) {
    finalAmount = getCountryEconomyAdjustedPrice(
      country: country,
      basePrice: amount,
    );
  } else {
    finalAmount = amount;
  }

  //format the final amount wo money string
  final String formattedFinalAmount = formatMoneyToString(finalAmount);

  //return the result
  return "$currency$formattedFinalAmount";
}
