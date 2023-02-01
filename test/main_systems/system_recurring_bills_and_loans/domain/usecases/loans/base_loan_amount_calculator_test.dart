import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/base_loan_amount_calculator.dart';

void main() {
  group("Base loan amount calculator usecase:", () {
    test(
      "given base down payment and base price return base price - base down payment",
      () {
        expect(
          BaseLoanAmountCalculatorUsecase().execute(baseDownPayment: 100, basePrice: 1000,),
          900,
        );
      },
    );
  });
}
