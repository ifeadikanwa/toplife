import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("House")
class HouseTable extends Table {
  @override
  String? get tableName => "house";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get personId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  BoolColumn get isCurrentHome => boolean()();
  IntColumn get bedrooms => integer()();
  IntColumn get bathrooms => integer()();
  IntColumn get storage => integer()();
  TextColumn get address => text()();
  BoolColumn get isForRent => boolean()();
  TextColumn get buildingType => text()();
  TextColumn get settlement => text()();
  TextColumn get state => text()();
  TextColumn get country => text()();
  TextColumn get style => text()();
  IntColumn get lastMaintainedDay => integer()();
  IntColumn get basePrice => integer()();
  IntColumn get dayOfPurchase => integer()();
  IntColumn get endOfLeaseDay => integer()();
  IntColumn get condition => integer()();
  IntColumn get purchasePrice => integer()();
  BoolColumn get fullyPaidFor => boolean()();
}
