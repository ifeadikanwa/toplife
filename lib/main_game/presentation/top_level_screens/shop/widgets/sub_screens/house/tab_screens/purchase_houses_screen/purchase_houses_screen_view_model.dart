import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/get_buildings/get_purchase_houses_usecase.dart';

final purchaseHousesScreenViewModelProvider = StateNotifierProvider<
    PurchaseHousesScreenViewModel, AsyncValue<List<House>>>((ref) {
  //get recent
  final GetPurchaseHousesUsecase getPurchaseHousesUsecase =
      ref.watch(shopAndStorageUsecasesProvider).getPurchaseHousesUsecase;

  final Future<int?> currentPlayerIDFuture =
      ref.watch(currentPlayerProvider.selectAsync((person) => person?.id));

  return PurchaseHousesScreenViewModel(
    getPurchaseHousesUsecase: getPurchaseHousesUsecase,
    currentPlayerIDFuture: currentPlayerIDFuture,
  );
});

class PurchaseHousesScreenViewModel
    extends StateNotifier<AsyncValue<List<House>>> {
  //global
  final GetPurchaseHousesUsecase _getPurchaseHousesUsecase;
  final Future<int?> _currentPlayerIDFuture;

  PurchaseHousesScreenViewModel({
    required GetPurchaseHousesUsecase getPurchaseHousesUsecase,
    required Future<int?> currentPlayerIDFuture,
  })  : _getPurchaseHousesUsecase = getPurchaseHousesUsecase,
        _currentPlayerIDFuture = currentPlayerIDFuture,
        super(const AsyncLoading()) {
    _fetch(
      currentPlayerIDFuture: currentPlayerIDFuture,
      getPurchaseHousesUsecase: getPurchaseHousesUsecase,
    );
  }

  void _fetch({
    required Future<int?> currentPlayerIDFuture,
    required GetPurchaseHousesUsecase getPurchaseHousesUsecase,
  }) async {
    state = const AsyncLoading();

    final int? currentPlayerID = await currentPlayerIDFuture;

    //if we have a valid person, get purchase houses list
    if (currentPlayerID != null) {
      final List<House> purchaseHousesList =
          await getPurchaseHousesUsecase.execute(personID: currentPlayerID);

      state = await AsyncValue.guard(() async => purchaseHousesList);
    }
    //else set state to an empty list
    else {
      state = await AsyncValue.guard(() async => []);
    }
  }

  void regenerateHouses() {
    _fetch(
      currentPlayerIDFuture: _currentPlayerIDFuture,
      getPurchaseHousesUsecase: _getPurchaseHousesUsecase,
    );
  }

  void removePurchasedHouseFromShop(House house) async {
    //get current list from state
    final List<House>? currentListOfHouses = state.valueOrNull;

    //if list is valid, take out the purchased house
    if (currentListOfHouses != null && currentListOfHouses.isNotEmpty) {
      state = const AsyncLoading();

      //remove the purchased house this way so the ui reacts immediately
      state = await AsyncValue.guard(() async => currentListOfHouses
          .where(
            (houseElement) => houseElement != house,
          )
          .toList());
    }
  }
}
