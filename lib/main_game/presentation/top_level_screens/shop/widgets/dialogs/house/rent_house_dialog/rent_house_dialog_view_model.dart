import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/tab_screens/rental_houses_screen/rental_houses_screen_view_model.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/house_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/get_current_house_storage_space_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/rent/rent_house_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_storage_change_label.dart';

final rentHouseDialogViewModelProvider = StateNotifierProvider.autoDispose<
    RentHouseDialogViewModel, AsyncValue<int>>((ref) {
  //get recent
  final Future<int?> currentPlayerIDFuture = ref.watch(
    currentPlayerProvider.selectAsync((currentPlayer) => currentPlayer?.id),
  );
  final RentalHousesScreenViewModel rentalHousesScreenViewModel =
      ref.watch(rentalHousesScreenViewModelProvider.notifier);

  return RentHouseDialogViewModel(
    rentHouseUsecase:
        ref.watch(shopAndStorageUsecasesProvider).rentHouseUsecase,
    rentalHousesScreenViewModel: rentalHousesScreenViewModel,
    currentPlayerIDFuture: currentPlayerIDFuture,
    getCurrentHouseStorageSpaceUsecase: ref
        .watch(shopAndStorageUsecasesProvider)
        .getCurrentHouseStorageSpaceUsecase,
  );
});

class RentHouseDialogViewModel extends StateNotifier<AsyncValue<int>> {
  final RentHouseUsecase _rentHouseUsecase;
  final RentalHousesScreenViewModel _rentalHousesScreenViewModel;
  late final int? _currentPlayerID;
  late final int _currentHouseStorage;

  //state = lease duration
  RentHouseDialogViewModel({
    required RentHouseUsecase rentHouseUsecase,
    required RentalHousesScreenViewModel rentalHousesScreenViewModel,
    required Future<int?> currentPlayerIDFuture,
    required GetCurrentHouseStorageSpaceUsecase
        getCurrentHouseStorageSpaceUsecase,
  })  : _rentHouseUsecase = rentHouseUsecase,
        _rentalHousesScreenViewModel = rentalHousesScreenViewModel,
        super(const AsyncLoading()) {
    _setup(
      currentPlayerIDFuture: currentPlayerIDFuture,
      getCurrentHouseStorageSpaceUsecase: getCurrentHouseStorageSpaceUsecase,
    );
  }

  void _setup({
    required Future<int?> currentPlayerIDFuture,
    required GetCurrentHouseStorageSpaceUsecase
        getCurrentHouseStorageSpaceUsecase,
  }) async {
    _currentPlayerID = await currentPlayerIDFuture;
    _currentHouseStorage = (_currentPlayerID != null)
        ? await getCurrentHouseStorageSpaceUsecase.execute(
            personID: _currentPlayerID!)
        : HouseConstants.homelessStorageSpace;

    state = await AsyncValue.guard(
      () async => HouseConstants.minLeaseAgreementDuration,
    );
  }

  void rentHouse(
    BuildContext context,
    House house,
  ) async {
    if (_currentPlayerID != null && state.valueOrNull != null) {
      final bool rentSuccessful = await _rentHouseUsecase.execute(
        context: context,
        house: house,
        personID: _currentPlayerID!,
        leaseDuration: state.valueOrNull!,
      );

      if (rentSuccessful) {
        _rentalHousesScreenViewModel.removeRentedHouseFromShop(house);
      }
    }
  }

  String getStorageChangeLabel({
    required int newHouseStorage,
  }) {
    return getHouseStorageChangeLabel(
      newHouseStorage: newHouseStorage,
      currentHouseStorage: _currentHouseStorage,
    );
  }

  void increaseLeaseDuration() async {
    final int? currentState = state.valueOrNull;
    if (currentState != null) {
      if (currentState < HouseConstants.maxLeaseAgreementDuration) {
        state = await AsyncValue.guard(() async =>
            currentState + HouseConstants.leaseAgreementDurationIncrement);
      }
    }
  }

  void decreaseLeaseDuration() async {
    final int? currentState = state.valueOrNull;
    if (currentState != null) {
      if (currentState > HouseConstants.minLeaseAgreementDuration) {
        state = await AsyncValue.guard(() async =>
            currentState - HouseConstants.leaseAgreementDurationIncrement);
      }
    }
  }
}
