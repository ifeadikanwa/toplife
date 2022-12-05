import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/recurring_bill.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/school/student_loan_calculator_usecase.dart';

void main() {
  group("Student loan calculator usecase:", () {
    test(
      "calculator adjusts the base loan to the economy of given country and then returns the correct loan amount using student loan interest",
      () {
        final canada = Canada();
        const baseLoan = 1000;
        final int expectedResult = (baseLoan * canada.economy) +
            (baseLoan *
                    canada.economy *
                    (RecurringBill.studentLoanInterest / 100))
                .ceil();

        expect(
          StudentLoanCalculatorUsecase().execute(
            baseLoanAmount: baseLoan,
            country: "Canada",
          ),
          expectedResult,
        );
      },
    );
  });
}
