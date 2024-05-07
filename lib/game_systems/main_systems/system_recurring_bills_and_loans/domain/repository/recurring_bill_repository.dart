import 'package:toplife/core/data_source/drift_database/database_provider.dart';

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
  Stream<List<RecurringBill>> watchAllRecurringBill(int personID);
}
