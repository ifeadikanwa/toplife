import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("RecurringBill")
class RecurringBillTable extends Table {
  @override
  String? get tableName => "recurring_bill";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get personId => integer().references(PersonTable, #id)();
  TextColumn get billType => text()();
  TextColumn get billDescription => text()();
  IntColumn get billAmount => integer()();
  IntColumn get paymentsLeft => integer()();
  IntColumn get dueDay => integer()();
  IntColumn get purchaseId => integer()();
  IntColumn get missedPayments => integer()();
  BoolColumn get isUrgent => boolean()();
}
