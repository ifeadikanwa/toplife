import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/recurring_bill.dart';

abstract class RecurringBillDao {
  Future<RecurringBill> createRecurringBill(RecurringBill recurringBill);
  Future<RecurringBill?> getRecurringBill(int recurringBillID);
  Future<RecurringBill?> findPurchaseRecurringBill(
    int personID,
    int purchaseID,
    String billType,
  );
  Future<List<RecurringBill>> getTheDaysRecurringBills(
      int personID, int dueDay);
  Future<void> updateRecurringBill(RecurringBill recurringBill);
  Future<void> deleteRecurringBill(int recurringBillID);
  Future<List<RecurringBill>> getAllRecurringBill(int personID);
}
