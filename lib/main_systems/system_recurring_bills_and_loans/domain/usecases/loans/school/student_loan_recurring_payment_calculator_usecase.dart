import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/recurring_bill.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/school/student_loan_calculator_usecase.dart';

class StudentLoanRecurringPaymentCalculatorUsecase {
  final StudentLoanCalculatorUsecase _studentLoanCalculatorUsecase;

  const StudentLoanRecurringPaymentCalculatorUsecase(
    this._studentLoanCalculatorUsecase,
  );

  int execute({
    required int baseLoanAmount,
    required String country,
  }) {
    //calculate recurring payment = (loan + interest)/number of payments

    final int totalLoan = _studentLoanCalculatorUsecase.execute(
      baseLoanAmount: baseLoanAmount,
      country: country,
    );

    final int recurringPayment =
        (totalLoan / RecurringBill.studentLoanNumOfPayments).ceil();

    return recurringPayment;
  }
}
