import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/recurring_bill.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/mortgage_loan_calculator_usecase.dart';

class MortgageLoanRecurringPaymentCalculatorUsecase {
  final MortgageLoanCalculatorUsecase _mortgageLoanCalculatorUsecase;

  const MortgageLoanRecurringPaymentCalculatorUsecase(
    this._mortgageLoanCalculatorUsecase,
  );

  int execute({
    required int baseLoanAmount,
    required String country,
  }) {
    //calculate recurring payment = (loan + interest)/number of payments

    final int totalLoan = _mortgageLoanCalculatorUsecase.execute(
      baseLoanAmount: baseLoanAmount,
      country: country,
    );

    final int recurringPayment =
        (totalLoan / RecurringBill.mortgageLoanNumOfPayments).ceil();

    return recurringPayment;
  }
}
