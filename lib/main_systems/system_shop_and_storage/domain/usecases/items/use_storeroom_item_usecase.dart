import 'package:toplife/main_systems/system_shop_and_storage/domain/model/storeroom_item.dart';
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
      _storeroomItemRepository.updateStoreroomItem(
        storeroomItem.copyWith(
          countsLeft: (newCountsLeft > 0) ? newCountsLeft : 0,
        ),
      );
    }
  }
}
