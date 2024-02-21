import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';

class RemoveMortgageLoanFromBillsUsecase {
  final RecurringBillRepository _recurringBillRepository;

  const RemoveMortgageLoanFromBillsUsecase(
    this._recurringBillRepository,
  );

  Future<void> execute({
    required int personID,
    required int houseID,
  }) async {
    //get the particular rent
    final RecurringBill? mortgageLoan =
        await _recurringBillRepository.findPurchaseRecurringBill(
      personID: personID,
      purchaseID: houseID,
      billType: BillType.mortgageLoan.name,
    );

    //delete it if it exists
    if (mortgageLoan != null) {
      await _recurringBillRepository.deleteRecurringBill(mortgageLoan.id);
    }
  }
}
