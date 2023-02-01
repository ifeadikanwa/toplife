import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/base_down_payment_calculator_usecase.dart';

void main() {
  group("Base down payment calculator usecase:", () {
    test(
      "given base down payment percentage and base price return the base down payment % of the base price",
      () {
        expect(
          BaseDownPaymentCalculatorUsecase().execute(
            downPaymentPercentage: 50,
            basePrice: 200,
          ),
          100,
        );
      },
    );
  });
}
