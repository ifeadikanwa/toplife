import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/recurring_bill.dart';

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
        ((RecurringBill.carLoanInterest / 100) * economyAdjustedLoanAmount)
            .ceil();

    final int totalLoan = economyAdjustedLoanAmount + loanInterest;

    return totalLoan;
  }
}
