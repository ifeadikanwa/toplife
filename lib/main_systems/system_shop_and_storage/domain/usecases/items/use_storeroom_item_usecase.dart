import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/storeroom_item_repository.dart';

class UseStoreroomItemUsecase {
  final StoreroomItemRepository _storeroomItemRepository;
  const UseStoreroomItemUsecase({
    required StoreroomItemRepository storeroomItemRepository,
  }) : _storeroomItemRepository = storeroomItemRepository;

  Future<void> execute({
    required int storeroomItemID,
    int countsToUse = 1,
  }) async {
    final StoreroomItem? storeroomItem =
        await _storeroomItemRepository.getStoreroomItem(
      storeroomItemID,
    );

    if (storeroomItem != null) {
      int newCountsLeft = storeroomItem.countsLeft - countsToUse;

      //if the new count left is less than zero set it as zero else use the value we calculated
      await _storeroomItemRepository.updateStoreroomItem(
        storeroomItem.copyWith(
          countsLeft: (newCountsLeft > 0) ? newCountsLeft : 0,
        ),
      );
    }
  }
}
