import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/storeroom_item_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/storeroom_item.dart';

part 'storeroom_item_dao_impl.g.dart';

@DriftAccessor(tables: [StoreroomItemTable])
class StoreroomItemDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$StoreroomItemDaoImplMixin
    implements StoreroomItemDao {
  StoreroomItemDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<StoreroomItem> createStoreroomItem(StoreroomItem storeroomItem) async {
    final StoreroomItemTableCompanion storeroomItemWithoutID =
        storeroomItem.toCompanion(false).copyWith(id: const Value.absent());

    final storeroomItemID = await into(storeroomItemTable)
        .insertOnConflictUpdate(storeroomItemWithoutID);
    return storeroomItem.copyWith(id: storeroomItemID);
  }

  @override
  Future<void> deleteStoreroomItem(int storeroomItemID) {
    return (delete(storeroomItemTable)
          ..where(
            (storeroomItem) => storeroomItem.id.equals(storeroomItemID),
          ))
        .go();
  }

  @override
  Future<StoreroomItem?> findParticularStoreroomItem(
      {required int personID, required int itemID}) {
    return (select(storeroomItemTable)
          ..where(
            (storeroomItem) =>
                storeroomItem.personId.equals(personID) &
                storeroomItem.itemId.equals(itemID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<List<StoreroomItem>> getAllStoreroomItems(int personID) {
    return (select(storeroomItemTable)
          ..where(
            (storeroomItem) => storeroomItem.personId.equals(personID),
          ))
        .get();
  }

  @override
  Future<StoreroomItem?> getStoreroomItem(int storeroomItemID) {
    return (select(storeroomItemTable)
          ..where(
            (storeroomItem) => storeroomItem.id.equals(storeroomItemID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateStoreroomItem(StoreroomItem storeroomItem) {
    return update(storeroomItemTable).replace(storeroomItem);
  }

  @override
  Stream<List<StoreroomItem>> watchAllStoreroomItems(int personID) {
    return (select(storeroomItemTable)
          ..where(
            (storeroomItem) => storeroomItem.personId.equals(personID),
          ))
        .watch();
  }
}
