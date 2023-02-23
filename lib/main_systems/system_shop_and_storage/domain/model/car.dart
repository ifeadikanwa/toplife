import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("Car")
class CarTable extends Table {
  @override
  String? get tableName => "car";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get personId => integer().references(PersonTable, #id)();
  TextColumn get name => text()();
  TextColumn get type => text()();
  IntColumn get percentageOfTravelTime => integer()();
  TextColumn get quality => text()();
  IntColumn get basePrice => integer()();
  IntColumn get dayOfPurchase => integer()();
  IntColumn get fuelTank => integer()();
  TextColumn get problem => text()();
  IntColumn get useCondition => integer()();
  IntColumn get maxConditionAtPurchase => integer()();
  BoolColumn get fullyPaidFor => boolean()();
  BoolColumn get currentlyDriving => boolean()();
  BoolColumn get isInsured => boolean()();
  IntColumn get insuranceCost => integer()();
  TextColumn get insuranceType => text()();
}
