import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
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
    final int totalCount = quantity * item.count;

    final existingStoreroomItem =
        await _storeroomItemRepository.findParticularStoreroomItem(
      personID: personID,
      itemID: item.id,
    );

    //if storeroomItem already exists, update the record
    if (existingStoreroomItem != null) {
      final updatedCountsLeft = existingStoreroomItem.countsLeft + totalCount;

      final updatedExistingStoreroomItem = existingStoreroomItem.copyWith(
        countsLeft: updatedCountsLeft,
      );

      await _storeroomItemRepository.updateStoreroomItem(
        updatedExistingStoreroomItem,
      );
    }
    //else create a new record
    else {
      final createdStoreroomItem = StoreroomItem(
        id: DatabaseConstants.dummyId,
        personId: personID,
        itemId: item.id,
        countsLeft: totalCount,
      );

      await _storeroomItemRepository.createStoreroomItem(createdStoreroomItem);
    }
  }
}
