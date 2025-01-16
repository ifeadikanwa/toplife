import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class ItemRepository{
  Future<Item> createItem(Item item);
  Future<void> updateItem(Item item);
  Future<Item?> getItem(int itemID);
  Future<Item?> findItemWithName(String itemName);
}