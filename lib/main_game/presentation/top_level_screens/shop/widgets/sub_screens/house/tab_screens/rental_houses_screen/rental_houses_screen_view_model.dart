import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/get_buildings/get_rental_houses_usecase.dart';

final rentalHousesScreenViewModelProvider =
    StateNotifierProvider<RentalHousesScreenViewModel, AsyncValue<List<House>>>(
        (ref) {
  //get recent

  final GetRentalHousesUsecase getRentalHousesUsecase =
      ref.watch(shopAndStorageUsecasesProvider).getRentalHousesUsecase;

  final Future<int?> currentPlayerIDFuture =
      ref.watch(currentPlayerProvider.selectAsync((person) => person?.id));

  return RentalHousesScreenViewModel(
    getRentalHousesUsecase: getRentalHousesUsecase,
    currentPlayerIDFuture: currentPlayerIDFuture,
  );
});

class RentalHousesScreenViewModel
    extends StateNotifier<AsyncValue<List<House>>> {
  //global
  final GetRentalHousesUsecase _getRentalHousesUsecase;
  final Future<int?> _currentPlayerIDFuture;

  RentalHousesScreenViewModel({
    required GetRentalHousesUsecase getRentalHousesUsecase,
    required Future<int?> currentPlayerIDFuture,
  })  : _getRentalHousesUsecase = getRentalHousesUsecase,
        _currentPlayerIDFuture = currentPlayerIDFuture,
        super(const AsyncLoading()) {
    _fetch(
      currentPlayerIDFuture: currentPlayerIDFuture,
      getRentalHousesUsecase: getRentalHousesUsecase,
    );
  }

  void _fetch({
    required Future<int?> currentPlayerIDFuture,
    required GetRentalHousesUsecase getRentalHousesUsecase,
  }) async {
    state = const AsyncLoading();

    final int? currentPlayerID = await currentPlayerIDFuture;

    //if we have a valid person, get purchase houses list
    if (currentPlayerID != null) {
      final List<House> rentalHousesList =
          await getRentalHousesUsecase.execute(personID: currentPlayerID);

      state = await AsyncValue.guard(() async => rentalHousesList);
    }
    //else set state to an empty list
    else {
      state = await AsyncValue.guard(() async => []);
    }
  }

  void regenerateHouses() {
    _fetch(
      currentPlayerIDFuture: _currentPlayerIDFuture,
      getRentalHousesUsecase: _getRentalHousesUsecase,
    );
  }

  void removeRentedHouseFromShop(House house) async {
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
