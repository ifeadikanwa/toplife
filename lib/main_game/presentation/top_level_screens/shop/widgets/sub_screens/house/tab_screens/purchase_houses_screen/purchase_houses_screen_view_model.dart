import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

part 'purchase_houses_screen_view_model.g.dart';

@riverpod
class PurchaseHousesScreenViewModel extends _$PurchaseHousesScreenViewModel {
  @override
  Future<List<House>> build() async {
    final int? currentPlayerId = await ref.watch(
      currentPlayerProvider.selectAsync(
        (data) => data?.id,
      ),
    );

    //if we don't have a valid id return empty list, else get list of rental houses
    return (currentPlayerId == null)
        ? []
        : await ref
            .watch(shopAndStorageUsecasesProvider)
            .getPurchaseHousesUsecase
            .execute(personID: currentPlayerId);
  }

  void regenerateHouses() {
    ref.invalidateSelf();
  }

  void removePurchasedHouseFromShop(House house) async {
    //get current list from state
    final List<House>? currentListOfHouses = state.valueOrNull;

    if (currentListOfHouses != null) {
      //we don't have any/enough houses in the list
      if (currentListOfHouses.isEmpty || currentListOfHouses.length == 1) {
        regenerateHouses();
      } else {
        //remove the purchased house this way so the ui reacts immediately
        state = AsyncData(
          currentListOfHouses
              .where((houseElement) => houseElement != house)
              .toList(),
        );
      }
    }
  }
}
