import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/item_repository.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/get_available_storeroom_items_usecase.dart';

class GetStoreroomItemPairsUsecase {
  final ItemRepository _itemRepository;
  final GetAvailbleStoreroomItemUsecase _getAvailbleStoreroomItemUsecase;

  const GetStoreroomItemPairsUsecase({
    required ItemRepository itemRepository,
    required GetAvailbleStoreroomItemUsecase getAvailbleStoreroomItemUsecase,
  })  : _itemRepository = itemRepository,
        _getAvailbleStoreroomItemUsecase = getAvailbleStoreroomItemUsecase;

  Future<List<StoreroomItemPair>> execute(int mainPersonID) async {
    //get all storeroom items
    //for every storeroom item get the corresponding item
    //add them both to the list

    List<StoreroomItemPair> pairsList = [];

    final List<StoreroomItem> availableStoreroomItems =
        await _getAvailbleStoreroomItemUsecase.execute(
      mainPersonID: mainPersonID,
    );

    for (var storeroomItem in availableStoreroomItems) {
      final Item? item = await _itemRepository.getItem(storeroomItem.itemId);

      if (item != null) {
        pairsList.add(
          StoreroomItemPair(
            storeroomItem: storeroomItem,
            item: item,
          ),
        );
      }
    }

    return pairsList;
  }
}
