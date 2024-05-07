import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';

class RemoveCarLoanFromBillsUsecase {
  final RecurringBillRepository _recurringBillRepository;

  const RemoveCarLoanFromBillsUsecase(
    this._recurringBillRepository,
  );

  Future<void> execute({
    required int personID,
    required int carID,
  }) async {
    //get the particular rent
    final RecurringBill? carLoan =
        await _recurringBillRepository.findPurchaseRecurringBill(
      personID: personID,
      purchaseID: carID,
      billType: BillType.carLoan.name,
    );

    //delete it if it exists
    if (carLoan != null) {
     await _recurringBillRepository.deleteRecurringBill(carLoan.id);
    }
  }
}
