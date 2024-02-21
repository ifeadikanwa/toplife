import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/dao/recurring_bill_dao.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/recurring_bill.dart';

part 'recurring_bill_dao_impl.g.dart';

@DriftAccessor(tables: [RecurringBillTable])
class RecurringBillDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$RecurringBillDaoImplMixin
    implements RecurringBillDao {
  RecurringBillDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<RecurringBill> createRecurringBill(RecurringBill recurringBill) async {
    final RecurringBillTableCompanion recurringBillWithoutID =
        recurringBill.toCompanion(false).copyWith(id: const Value.absent());

    final recurringBillID = await into(recurringBillTable)
        .insertOnConflictUpdate(recurringBillWithoutID);
    return recurringBill.copyWith(id: recurringBillID);
  }

  @override
  Future<void> deleteRecurringBill(int recurringBillID) {
    return (delete(recurringBillTable)
          ..where((recurringBill) => recurringBill.id.equals(recurringBillID)))
        .go();
  }

  @override
  Future<RecurringBill?> findPurchaseRecurringBill(
      int personID, int purchaseID, String billType) {
    return (select(recurringBillTable)
          ..where(
            (recurringBill) =>
                recurringBill.personId.equals(personID) &
                recurringBill.purchaseId.equals(purchaseID) &
                recurringBill.billType.equals(billType),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<List<RecurringBill>> findRecurringBillsWithType(
      int personID, String billType) {
    return (select(recurringBillTable)
          ..where(
            (recurringBill) =>
                recurringBill.personId.equals(personID) &
                recurringBill.billType.equals(billType),
          ))
        .get();
  }

  @override
  Future<List<RecurringBill>> getAllRecurringBill(int personID) {
    return (select(recurringBillTable)
          ..where(
            (recurringBill) => recurringBill.personId.equals(personID),
          ))
        .get();
  }

  @override
  Future<RecurringBill?> getRecurringBill(int recurringBillID) {
    return (select(recurringBillTable)
          ..where((recurringBill) => recurringBill.id.equals(recurringBillID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<List<RecurringBill>> getTheDaysRecurringBills(
      int personID, int dueDay) {
    return (select(recurringBillTable)
          ..where(
            (recurringBill) =>
                recurringBill.personId.equals(personID) &
                recurringBill.dueDay.equals(dueDay),
          ))
        .get();
  }

  @override
  Future<void> updateRecurringBill(RecurringBill recurringBill) {
    return update(recurringBillTable).replace(recurringBill);
  }

  @override
  Stream<List<RecurringBill>> watchAllRecurringBill(int personID) {
    return (select(recurringBillTable)
          ..where(
            (recurringBill) => recurringBill.personId.equals(personID),
          ))
        .watch();
  }
}
