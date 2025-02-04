import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/dao/recurring_bill_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';

class RecurringBillRepositoryImpl implements RecurringBillRepository {
  final RecurringBillDao _recurringBillDao;

  const RecurringBillRepositoryImpl({
    required RecurringBillDao recurringBillDao,
  }) : _recurringBillDao = recurringBillDao;

  @override
  Future<RecurringBill> createRecurringBill(RecurringBill recurringBill) {
    return _recurringBillDao.createRecurringBill(recurringBill);
  }

  @override
  Future<void> deleteRecurringBill(int recurringBillID) {
    return _recurringBillDao.deleteRecurringBill(recurringBillID);
  }

  @override
  Future<List<RecurringBill>> getAllRecurringBill(int personID) {
    return _recurringBillDao.getAllRecurringBill(personID);
  }

  @override
  Future<RecurringBill?> getRecurringBill(int recurringBillID) {
    return _recurringBillDao.getRecurringBill(recurringBillID);
  }

  @override
  Future<void> updateRecurringBill(RecurringBill recurringBill) {
    return _recurringBillDao.updateRecurringBill(recurringBill);
  }

  @override
  Future<List<RecurringBill>> getTheDaysRecurringBills({
    required int personID,
    required int dueDay,
  }) {
    return _recurringBillDao.getTheDaysRecurringBills(
      personID,
      dueDay,
    );
  }

  @override
  Future<RecurringBill?> findPurchaseRecurringBill({
    required int personID,
    required int purchaseID,
    required String billType,
  }) {
    return _recurringBillDao.findPurchaseRecurringBill(
      personID,
      purchaseID,
      billType,
    );
  }

  @override
  Future<List<RecurringBill>> findRecurringBillsWithType(
      {required int personID, required String billType}) {
    return _recurringBillDao.findRecurringBillsWithType(personID, billType);
  }

  @override
  Stream<List<RecurringBill>> watchAllRecurringBill(int personID) {
    return _recurringBillDao.watchAllRecurringBill(personID);
  }
}
