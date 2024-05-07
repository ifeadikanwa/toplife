import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/dao/item_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemDao _itemDao;

  const ItemRepositoryImpl({
    required ItemDao itemDao,
  }) : _itemDao = itemDao;

  @override
  Future<Item> createItem(Item item) async {
    return _itemDao.createItem(item);
  }

  @override
  Future<Item?> findItemWithName(String itemName) async {
    return _itemDao.findItemWithName(itemName);
  }

  @override
  Future<Item?> getItem(int itemID) async {
    return _itemDao.getItem(itemID);
  }

  @override
  Future<void> updateItem(Item item) async {
    return _itemDao.updateItem(item);
  }
}
