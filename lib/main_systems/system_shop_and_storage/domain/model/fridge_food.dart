import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/food.dart';

@DataClassName("FridgeFood")
class FridgeFoodTable extends Table {
  @override
  String? get tableName => "fridge_food";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get personId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get foodId => integer().references(
        FoodTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get servingsLeft => integer()();
  IntColumn get expiryDay => integer()();
}
