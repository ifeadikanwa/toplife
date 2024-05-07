import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';

class RemovePropertyTaxFromBillsUsecase {
  final RecurringBillRepository _recurringBillRepository;

  const RemovePropertyTaxFromBillsUsecase(
    this._recurringBillRepository,
  );

  Future<void> execute({
    required int personID,
    required int houseID,
  }) async {
    //get the particular propertyTax
    final RecurringBill? propertyTax =
        await _recurringBillRepository.findPurchaseRecurringBill(
      personID: personID,
      purchaseID: houseID,
      billType: BillType.propertyTax.name,
    );

    //delete it if it exists
    if (propertyTax != null) {
      await _recurringBillRepository.deleteRecurringBill(propertyTax.id);
    }
  }
}
