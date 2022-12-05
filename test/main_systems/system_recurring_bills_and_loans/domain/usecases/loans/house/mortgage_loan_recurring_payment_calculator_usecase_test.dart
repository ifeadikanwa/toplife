import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/recurring_bill.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/mortgage_loan_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/mortgage_loan_recurring_payment_calculator_usecase.dart';

void main() {
  group("Mortgage loan recurring payment calculator:", () {
    test(
      "loan amount is calculated and then split by mortgage loan number of payments constant",
      () {
        final canada = Canada();
        const baseLoan = 1000;
        final int expectedResult = (((baseLoan * canada.economy) +
                    (baseLoan *
                            canada.economy *
                            (RecurringBill.mortgageLoanInterest / 100))
                        .ceil()) /
                RecurringBill.mortgageLoanNumOfPayments)
            .ceil();

        expect(
          MortgageLoanRecurringPaymentCalculatorUsecase(
                  MortgageLoanCalculatorUsecase())
              .execute(
            baseLoanAmount: baseLoan,
            country: "Canada",
          ),
          expectedResult,
        );
      },
    );
  });
}
