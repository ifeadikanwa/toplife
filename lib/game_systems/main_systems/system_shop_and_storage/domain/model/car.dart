import 'package:drift/drift.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/person.dart';

@DataClassName("Car")
class CarTable extends Table {
  @override
  String? get tableName => "car";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get personId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get name => text()();
  TextColumn get type => text()();
  IntColumn get percentageOfTravelTime => integer()();
  TextColumn get quality => text()();
  IntColumn get basePrice => integer()();
  IntColumn get dayOfPurchase => integer()();
  IntColumn get fuelTank => integer()();
  //this is the highest condition the car will ever have.
  //the current condition is derived from the max condition
  IntColumn get maxConditionAtPurchase => integer()();
  //used to fluctuate max depreciation when calculating the current condition.
  IntColumn get depreciationFluctuator => integer()();
  //shown to the player. Updated whenever maintenance is done.
  IntColumn get lastKnownCondition => integer()();
  //shown to the player so they know when the condition was last updated & maintenance was last done.
  IntColumn get lastMaintenanceDay => integer()();
  BoolColumn get fullyPaidFor => boolean()();
  BoolColumn get currentlyDriving => boolean()();
  BoolColumn get isInsured => boolean()();
  IntColumn get insuranceCost => integer()();
  TextColumn get insuranceType => text()();
}
