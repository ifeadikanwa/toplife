import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/storeroom_item_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/storeroom_item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/storeroom_item_repository.dart';

class StoreroomItemRepositoryImpl implements StoreroomItemRepository {
  final StoreroomItemDao _storeroomItemDao;

  const StoreroomItemRepositoryImpl({
    required StoreroomItemDao storeroomItemDao,
  }) : _storeroomItemDao = storeroomItemDao;

  @override
  Future<StoreroomItem> createStoreroomItem(StoreroomItem storeroomItem) {
    return _storeroomItemDao.createStoreroomItem(storeroomItem);
  }

  @override
  Future<void> deleteStoreroomItem(int storeroomItemID) {
    return _storeroomItemDao.deleteStoreroomItem(storeroomItemID);
  }

  @override
  Future<List<StoreroomItem>> getAllStoreroomItems(int personID) {
    return _storeroomItemDao.getAllStoreroomItems(personID);
  }

  @override
  Future<StoreroomItem?> getStoreroomItem(int storeroomItemID) {
    return _storeroomItemDao.getStoreroomItem(storeroomItemID);
  }

  @override
  Future<void> updateStoreroomItem(StoreroomItem storeroomItem) {
    return _storeroomItemDao.updateStoreroomItem(storeroomItem);
  }
}
