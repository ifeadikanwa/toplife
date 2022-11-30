import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/dao/recurring_bill_dao.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/recurring_bill.dart';

class RecurringBillDaoImpl implements RecurringBillDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const recurringBillTable = "recurring_bill";

  static const createTableQuery = '''
    CREATE TABLE $recurringBillTable(
      ${RecurringBill.idColumn} $idType,
      ${RecurringBill.personIDColumn} $integerType,
      ${RecurringBill.billTypeColumn} $textType,
      ${RecurringBill.billDescriptionColumn} $textType,
      ${RecurringBill.billAmountColumn} $integerType,
      ${RecurringBill.paymentsLeftColumn} $integerType,
      ${RecurringBill.dueDayColumn} $integerType,
      ${RecurringBill.purchaseIDColumn} $integerType,
      ${RecurringBill.missedPaymentsColumn} $integerType,
      ${RecurringBill.isUrgentColumn} $boolType,
      FOREIGN KEY (${RecurringBill.personIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
  ''';

  @override
  Future<RecurringBill> createRecurringBill(RecurringBill recurringBill) async {
    final db = await _databaseProvider.database;
    final id = await db.insert(
      recurringBillTable,
      recurringBill.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return recurringBill.copyWith(id: id);
  }

  @override
  Future<void> deleteRecurringBill(int recurringBillID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      recurringBillTable,
      where: "${RecurringBill.idColumn} = ?",
      whereArgs: [recurringBillID],
    );
  }

  @override
  Future<RecurringBill?> getRecurringBill(int recurringBillID) async {
    final db = await _databaseProvider.database;
    final recurringBillMaps = await db.query(
      recurringBillTable,
      columns: RecurringBill.allColumns,
      where: "${RecurringBill.idColumn} = ?",
      whereArgs: [recurringBillID],
    );

    if (recurringBillMaps.isNotEmpty) {
      return RecurringBill.fromMap(recurringBillMap: recurringBillMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateRecurringBill(RecurringBill recurringBill) async {
    final db = await _databaseProvider.database;
    await db.update(
      recurringBillTable,
      recurringBill.toMap(),
      where: "${RecurringBill.idColumn} = ?",
      whereArgs: [recurringBill.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<RecurringBill>> getAllRecurringBill(int personID) async {
    final db = await _databaseProvider.database;
    final allRecurringBillsMap = await db.query(
      recurringBillTable,
      columns: RecurringBill.allColumns,
      where: "${RecurringBill.personIDColumn} = ?",
      whereArgs: [personID],
    );

    return allRecurringBillsMap
        .map((recurringBillMap) => RecurringBill.fromMap(
              recurringBillMap: recurringBillMap,
            ))
        .toList();
  }

  @override
  Future<List<RecurringBill>> getTheDaysRecurringBills(
      int personID, int dueDay) async {
    final db = await _databaseProvider.database;
    final allRecurringBillsMap = await db.query(
      recurringBillTable,
      columns: RecurringBill.allColumns,
      where:
          "${RecurringBill.personIDColumn} = ? and ${RecurringBill.dueDayColumn} = ?",
      whereArgs: [personID, dueDay],
    );

    return allRecurringBillsMap
        .map((recurringBillMap) => RecurringBill.fromMap(
              recurringBillMap: recurringBillMap,
            ))
        .toList();
  }

  @override
  Future<RecurringBill?> findPurchaseRecurringBill(
    int personID,
    int purchaseID,
    String billType,
  ) async {
    final db = await _databaseProvider.database;
    final recurringBillMaps = await db.query(
      recurringBillTable,
      columns: RecurringBill.allColumns,
      where:
          "${RecurringBill.personIDColumn} = ? and ${RecurringBill.purchaseIDColumn} = ? and ${RecurringBill.billTypeColumn} = ?",
      whereArgs: [
        personID,
        purchaseID,
        billType,
      ],
    );

    if (recurringBillMaps.isNotEmpty) {
      return RecurringBill.fromMap(recurringBillMap: recurringBillMaps.first);
    } else {
      return null;
    }
  }
}
