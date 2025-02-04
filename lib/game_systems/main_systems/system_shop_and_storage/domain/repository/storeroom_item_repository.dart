import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class StoreroomItemRepository {
  Future<StoreroomItem> createStoreroomItem(StoreroomItem storeroomItem);
  Future<StoreroomItem?> getStoreroomItem(int storeroomItemID);
  Future<void> updateStoreroomItem(StoreroomItem storeroomItem);
  Future<void> deleteStoreroomItem(int storeroomItemID);
  Future<List<StoreroomItem>> getAllStoreroomItems(int personID);
  Future<StoreroomItem?> findParticularStoreroomItem({
    required int personID,
    required int itemID,
  });
  Stream<List<StoreroomItem>> watchAllStoreroomItems(int personID);
}
