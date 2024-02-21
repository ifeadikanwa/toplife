import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';

class RemoveStudentLoanFromBillsUsecase {
  final RecurringBillRepository _recurringBillRepository;

  const RemoveStudentLoanFromBillsUsecase(
    this._recurringBillRepository,
  );

  Future<void> execute({
    required int personID,
    required int schoolID,
  }) async {
    //get the particular rent
    final RecurringBill? studentLoan =
        await _recurringBillRepository.findPurchaseRecurringBill(
      personID: personID,
      purchaseID: schoolID,
      billType: BillType.studentLoan.name,
    );

    //delete it if it exists
    if (studentLoan != null) {
      await _recurringBillRepository.deleteRecurringBill(studentLoan.id);
    }
  }
}
