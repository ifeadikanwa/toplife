import 'package:toplife/game_systems/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/recurring_bill_constants.dart';

class ExpectedReserveForMultipleMortgageCalculatorUsecase {
  int execute({
    required int economyAdjustedDownPayment,
    required int houseBasePrice,
    required String country,
  }) {
    //calculate the reserve
    final int baseExpectedReserveAmount =
        ((RecurringBillConstants.multipleLoansExpectedBankReservePercentage /
                    100) *
                houseBasePrice)
            .ceil();

    //adjust to economy
    final int adjustedExpectedReserveAmount = getCountryEconomyAdjustedPrice(
      country: country,
      basePrice: baseExpectedReserveAmount,
    );

    //add the expected reserve + down payment
    //this will give you the total amount expected to be in the bank
    return adjustedExpectedReserveAmount + economyAdjustedDownPayment;
  }
}
