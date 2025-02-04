import 'package:drift/drift.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/model/item.dart';

@DataClassName("StoreroomItem")
class StoreroomItemTable extends Table {
  @override
  String? get tableName => "storeroom_item";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get personId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get itemId => integer().references(
        ItemTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get countsLeft => integer()();
}
