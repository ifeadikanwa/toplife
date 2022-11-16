import 'package:toplife/main_systems/system_shop_and_storage/domain/model/item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/storeroom_item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/storeroom_item_repository.dart';

class AddItemToStoreroomUsecase {
  final StoreroomItemRepository _storeroomItemRepository;

  const AddItemToStoreroomUsecase(
    this._storeroomItemRepository,
  );

  Future<void> execute({
    required int personID,
    required Item item,
    required int quantity,
  }) async {
    if (item.id != null) {
      final int totalCount = quantity * item.count;

      final existingStoreroomItem =
          await _storeroomItemRepository.findParticularStoreroomItem(
        personID: personID,
        itemID: item.id!,
      );

      //if storeroomItem already exists, update the record
      if (existingStoreroomItem != null) {
        final updatedCountsLeft = existingStoreroomItem.countsLeft + totalCount;

        final updatedExistingStoreroomItem = existingStoreroomItem.copyWith(
          countsLeft: updatedCountsLeft,
        );

        _storeroomItemRepository.updateStoreroomItem(
          updatedExistingStoreroomItem,
        );
      }
      //else create a new record
      else {
        final createdStoreroomItem = StoreroomItem(
          personID: personID,
          itemID: item.id!,
          countsLeft: totalCount,
        );

        _storeroomItemRepository.createStoreroomItem(createdStoreroomItem);
      }
    }
  }
}
