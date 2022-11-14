import 'package:toplife/main_systems/system_shop_and_storage/domain/model/storeroom_item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/storeroom_item_repository.dart';

class UseStoreroomItemUsecase {
  final StoreroomItemRepository _storeroomItemRepository;
  const UseStoreroomItemUsecase({
    required StoreroomItemRepository storeroomItemRepository,
  }) : _storeroomItemRepository = storeroomItemRepository;

  Future<void> execute({
    required int storeroomItemID,
    required int personID,
  }) async {
    final StoreroomItem? storeroomItem =
        await _storeroomItemRepository.getStoreroomItem(
      storeroomItemID,
    );

    if (storeroomItem != null) {
      int currentCount = storeroomItem.countsLeft;

      if (currentCount > 0) {
        _storeroomItemRepository.updateStoreroomItem(
          storeroomItem.copyWith(
            countsLeft: --currentCount,
          ),
        );
      }
    }
  }
}
