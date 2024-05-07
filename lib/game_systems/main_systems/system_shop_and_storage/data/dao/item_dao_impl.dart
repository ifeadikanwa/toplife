import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/dao/item_dao.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/model/item.dart';

part 'item_dao_impl.g.dart';

@DriftAccessor(tables: [ItemTable])
class ItemDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$ItemDaoImplMixin
    implements ItemDao {
  ItemDaoImpl(super.database);

  @override
  Future<Item> createItem(Item item) async {
    final ItemTableCompanion itemWithoutID =
        item.toCompanion(false).copyWith(id: const Value.absent());

    final itemID = await into(itemTable).insertOnConflictUpdate(itemWithoutID);
    return item.copyWith(id: itemID);
  }

  @override
  Future<Item?> findItemWithName(String itemName) {
    return (select(itemTable)
          ..where((item) => item.name.equals(itemName))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<Item?> getItem(int itemID) {
    return (select(itemTable)
          ..where((item) => item.id.equals(itemID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateItem(Item item) {
    return update(itemTable).replace(item);
  }
}
