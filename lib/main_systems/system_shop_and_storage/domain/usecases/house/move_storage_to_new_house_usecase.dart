import 'package:toplife/main_systems/system_shop_and_storage/domain/model/fridge_food.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/storeroom_item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/fridge_food_repository.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/food/use_food_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/get_available_storeroom_items_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/get_storeroom_item_pairs_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/use_storeroom_item_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_sum_count_of_food.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_sum_count_of_items.dart';

class MoveStorageToNewHouseUsecase {
  final GetAvailbleStoreroomItemUsecase _getAvailbleStoreroomItemUsecase;
  final GetStoreroomItemPairsUsecase _getStoreroomItemPairsUsecase;
  final FridgeFoodRepository _fridgeFoodRepository;
  final UseFoodUsecase _useFoodUsecase;
  final UseStoreroomItemUsecase _useStoreroomItemUsecase;

  const MoveStorageToNewHouseUsecase(
    this._getAvailbleStoreroomItemUsecase,
    this._getStoreroomItemPairsUsecase,
    this._fridgeFoodRepository,
    this._useFoodUsecase,
    this._useStoreroomItemUsecase,
  );

  Future<String> execute({
    required int personID,
    required int newHouseStorageSize,
  }) async {
    //get all food and items.
    final List<FridgeFood> ownedFood =
        await _fridgeFoodRepository.getAllFridgeFood(
      personID,
    );
    final List<StoreroomItem> ownedItems =
        await _getAvailbleStoreroomItemUsecase.execute(
      mainPersonID: personID,
    );

    final int totalItemsCount = getSumCountOfItems(ownedItems);

    final int totalFoodCount = getSumCountOfFood(ownedFood);

    //check if storage of new house is greater than users owned food & items
    //yes: do nothing and report that all items were successfully moved
    if (newHouseStorageSize >= totalItemsCount &&
        newHouseStorageSize >= totalFoodCount) {
      return ShopResultConstants.firstPersonCompleteMove;
    }

    //no: downsize
    //sort lists based on descending expiryday for food, and descending worth of items for items
    //while the count > storage: remove items from the bottom and delete from db
    else {
      //*if food has excess
      if (totalFoodCount > newHouseStorageSize) {
        //sort food in descending order of expiry day
        ownedFood.sort(
          (a, b) => b.expiryDay.compareTo(a.expiryDay),
        );

        //get the number of food we need to get rid of
        int foodToRemoveCount = totalFoodCount - newHouseStorageSize;

        //remove
        while (foodToRemoveCount > 0) {
          final currentFood = ownedFood.removeLast();

          //remove unneeded food(if foodtoremove > servingsleft the entire record is deleted)
          await _useFoodUsecase.execute(
            fridgeFoodID: currentFood.id!,
            servingsToUse: foodToRemoveCount,
          );

          //update counter
          foodToRemoveCount -= currentFood.servingsLeft;
        }
      }

      //*if items has excess
      if (totalItemsCount > newHouseStorageSize) {
        //get item information pair
        final List<StoreroomItemPair> ownedItemPairs =
            await _getStoreroomItemPairsUsecase.execute(
          personID,
        );

        //sort in descending order of price
        ownedItemPairs
            .sort((a, b) => (b.item.basePrice).compareTo((a.item.basePrice)));

        //extract sorted storeroom items from pair
        final List<StoreroomItem> sortedOwnedItems =
            ownedItemPairs.map((pair) => pair.storeroomItem).toList();

        //get the number of items we need to get rid of
        int itemsToRemoveCount = totalItemsCount - newHouseStorageSize;

        //remove
        while (itemsToRemoveCount > 0) {
          final StoreroomItem storeroomItem = sortedOwnedItems.removeLast();

          //remove the unneeded items(if item to remove > counts left it is set to 0)
          await _useStoreroomItemUsecase.execute(
            storeroomItemID: storeroomItem.id!,
            countsToUse: itemsToRemoveCount,
          );

          //update counter
          itemsToRemoveCount -= storeroomItem.countsLeft;
        }
      }

      return ShopResultConstants.firstPersonIncompleteMove;
    }
  }
}
