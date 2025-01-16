import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/recurring_bill_constants.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/mortgage_loan_calculator_usecase.dart';

void main() {
   group("Mortgage loan calculator usecase:", () {
    test(
      "calculator adjusts the base loan to the economy of given country and then returns the correct loan amount using mortgage loan interest",
      () {
        final canada = Canada();
        const baseLoan = 1000;
        final int expectedResult = (baseLoan * canada.economy) +
            (baseLoan * canada.economy * (RecurringBillConstants.mortgageLoanInterest / 100))
                .ceil();

        expect(
          MortgageLoanCalculatorUsecase().execute(
            baseLoanAmount: baseLoan,
            country: "Canada",
          ),
          expectedResult,
        );
      },
    );
  });
}