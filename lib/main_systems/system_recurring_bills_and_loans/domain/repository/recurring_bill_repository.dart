import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/recurring_bill.dart';

abstract class RecurringBillRepository {
  Future<RecurringBill> createRecurringBill(RecurringBill recurringBill);
  Future<RecurringBill?> getRecurringBill(int recurringBillID);
  Future<RecurringBill?> findPurchaseRecurringBill({
    required int personID,
    required int purchaseID,
    required String billType,
  });
  Future<List<RecurringBill>> getTheDaysRecurringBills({
    required int personID,
    required int dueDay,
  });
  Future<List<RecurringBill>> findRecurringBillsWithType({
    required int personID,
    required String billType,
  });
  Future<void> updateRecurringBill(RecurringBill recurringBill);
  Future<void> deleteRecurringBill(int recurringBillID);
  Future<List<RecurringBill>> getAllRecurringBill(int personID);
}
