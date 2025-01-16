import 'package:toplife/game_systems/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/recurring_bill_constants.dart';

class CarLoanCalculatorUsecase {
  int execute({
    required int baseLoanAmount,
    required String country,
  }) {
    //calculate economy adjusted loan amount
    //find the interest
    //total loan is loan amount + interest

    final int economyAdjustedLoanAmount = getCountryEconomyAdjustedPrice(
      country: country,
      basePrice: baseLoanAmount,
    );

    final int loanInterest =
        ((RecurringBillConstants.carLoanInterest / 100) * economyAdjustedLoanAmount)
            .ceil();

    final int totalLoan = economyAdjustedLoanAmount + loanInterest;

    return totalLoan;
  }
}
