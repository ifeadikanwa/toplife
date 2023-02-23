import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/storeroom_item_repository.dart';

class GetAvailbleStoreroomItemUsecase {
  final StoreroomItemRepository _storeroomItemRepository;

  const GetAvailbleStoreroomItemUsecase({
    required StoreroomItemRepository storeroomItemRepository,
  }) : _storeroomItemRepository = storeroomItemRepository;
  
  Future<List<StoreroomItem>> execute({required int mainPersonID}) async {

    final List<StoreroomItem> allStoreroomItems =
        await _storeroomItemRepository.getAllStoreroomItems(
      mainPersonID,
    );

    final List<StoreroomItem> availableStoreroomItems = allStoreroomItems
        .where((storeroomItem) => storeroomItem.countsLeft > 0)
        .toList();

    return availableStoreroomItems;
  }
}
