
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class RecurringBillDao {
  Future<RecurringBill> createRecurringBill(RecurringBill recurringBill);
  Future<RecurringBill?> getRecurringBill(int recurringBillID);
  Future<RecurringBill?> findPurchaseRecurringBill(
    int personID,
    int purchaseID,
    String billType,
  );
  Future<List<RecurringBill>> getTheDaysRecurringBills(
    int personID,
    int dueDay,
  );
  Future<List<RecurringBill>> findRecurringBillsWithType(
    int personID,
    String billType,
  );
  Future<void> updateRecurringBill(RecurringBill recurringBill);
  Future<void> deleteRecurringBill(int recurringBillID);
  Future<List<RecurringBill>> getAllRecurringBill(int personID);
  Stream<List<RecurringBill>> watchAllRecurringBill(int personID);
}
