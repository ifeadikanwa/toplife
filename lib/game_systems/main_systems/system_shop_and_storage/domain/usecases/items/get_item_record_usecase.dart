import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/item_repository.dart';

class GetItemRecordUsecase {
  final ItemRepository _itemRepository;

  const GetItemRecordUsecase(this._itemRepository);

  Future<Item> execute({
    required Item item,
  }) async {
    //find the item with name
    final Item? itemRecord = await _itemRepository.findItemWithName(item.name);

    //if found- update record with object recieved then return update
    if (itemRecord != null) {
      final Item updatedItemRecord = itemRecord.copyWith(
        type: item.type,
        basePrice: item.basePrice,
        count: item.count,
      );

      await _itemRepository.updateItem(updatedItemRecord);

      return updatedItemRecord;
    }
    //if not found- create new item record and return created object
    else {
      final Item createdItemRecord = await _itemRepository.createItem(item);

      return createdItemRecord;
    }
  }
}
