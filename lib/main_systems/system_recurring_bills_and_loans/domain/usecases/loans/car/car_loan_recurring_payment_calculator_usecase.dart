import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/recurring_bill_constants.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/car_loan_calculator_usecase.dart';

class CarLoanRecurringPaymentCalculatorUsecase {
  final CarLoanCalculatorUsecase _carLoanCalculatorUsecase;

  const CarLoanRecurringPaymentCalculatorUsecase(
      this._carLoanCalculatorUsecase);

  int execute({
    required int baseLoanAmount,
    required String country,
  }) {
    //calculate recurring payment = (loan + interest)/number of payments

    final int totalLoan = _carLoanCalculatorUsecase.execute(
      baseLoanAmount: baseLoanAmount,
      country: country,
    );

    final int recurringPayment =
        (totalLoan / RecurringBillConstants.carLoanNumOfPayments).ceil();

    return recurringPayment;
  }
}
