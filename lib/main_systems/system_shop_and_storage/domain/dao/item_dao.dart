import 'package:toplife/main_systems/system_shop_and_storage/domain/model/item.dart';

abstract class ItemDao{
  Future<Item> createItem(Item item);
  Future<void> updateItem(Item item);
  Future<Item?> getItem(int itemID);
  Future<Item?> findItemWithName(String itemName);
}