import 'package:drift/drift.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/person.dart';

@DataClassName("Jewelry")
class JewelryTable extends Table {
  @override
  String? get tableName => "jewelry";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get personId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get jewel => text()();
  TextColumn get type => text()();
  RealColumn get carat => real()();
  TextColumn get quality => text()();
  IntColumn get basePrice => integer()();
  IntColumn get dayOfPurchase => integer()();
  IntColumn get maxConditionAtPurchase => integer()();
}
