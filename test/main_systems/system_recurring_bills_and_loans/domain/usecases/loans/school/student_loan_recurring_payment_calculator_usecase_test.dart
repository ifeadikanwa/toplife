import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/recurring_bill_constants.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/school/student_loan_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/school/student_loan_recurring_payment_calculator_usecase.dart';

void main() {
  group("Student loan recurring payment calculator:", () {
    test(
      "loan amount is calculated and then split by student loan number of payments constant",
      () {
        final canada = Canada();
        const baseLoan = 1000;
        final int expectedResult = (((baseLoan * canada.economy) +
                    (baseLoan *
                            canada.economy *
                            (RecurringBillConstants.studentLoanInterest / 100))
                        .ceil()) /
                RecurringBillConstants.studentLoanNumOfPayments)
            .ceil();

        expect(
          StudentLoanRecurringPaymentCalculatorUsecase(
                  StudentLoanCalculatorUsecase())
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
