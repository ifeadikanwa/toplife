import 'package:toplife/main_systems/system_shop_and_storage/domain/model/storeroom_item.dart';

abstract class StoreroomItemRepository {
  Future<StoreroomItem> createStoreroomItem(StoreroomItem storeroomItem);
  Future<StoreroomItem?> getStoreroomItem(int storeroomItemID);
  Future<void> updateStoreroomItem(StoreroomItem storeroomItem);
  Future<void> deleteStoreroomItem(int storeroomItemID);
  Future<List<StoreroomItem>> getAllStoreroomItems(int personID);
}
