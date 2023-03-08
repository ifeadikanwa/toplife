import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/house/mortgagae_loan_dialog/mortgage_loan_dialog.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/house_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_storage_change_label.dart';

final buyHouseDialogViewModelProvider =
    FutureProvider<BuyHouseDialogViewModel>((ref) async {
  //get recent
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((currentPlayer) => currentPlayer?.id),
  );
  final shopAndStorageUsecases = ref.watch(shopAndStorageUsecasesProvider);

  final int currentHouseStorage = (currentPlayerID != null)
      ? await ref
          .watch(shopAndStorageUsecasesProvider)
          .getCurrentHouseStorageSpaceUsecase
          .execute(personID: currentPlayerID)
      : HouseConstants.homelessStorageSpace;

  return BuyHouseDialogViewModel(
    currentPlayerID: currentPlayerID,
    shopAndStorageUsecases: shopAndStorageUsecases,
    currentHouseStorage: currentHouseStorage,
  );
});

class BuyHouseDialogViewModel {
  final int? _currentPlayerID;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final int _currentHouseStorage;

  BuyHouseDialogViewModel({
    required int? currentPlayerID,
    required ShopAndStorageUsecases shopAndStorageUsecases,
    required int currentHouseStorage,
  })  : _currentPlayerID = currentPlayerID,
        _shopAndStorageUsecases = shopAndStorageUsecases,
        _currentHouseStorage = currentHouseStorage;

  String getStorageChangeLabel({
    required int newHouseStorage,
  }) {
    return getHouseStorageChangeLabel(
      newHouseStorage: newHouseStorage,
      currentHouseStorage: _currentHouseStorage,
    );
  }

  void purchaseHouse(
    BuildContext context,
    House house,
  ) {
    if (_currentPlayerID != null) {
      _shopAndStorageUsecases.purchaseHouseFullyPaidUsecase.execute(
        context: context,
        house: house,
        personID: _currentPlayerID!,
      );
    }
  }

  void goToMortgageLoanDialog(
    BuildContext context,
    House house,
  ) {
    if (_currentPlayerID != null) {
      showDialog(
        context: context,
        builder: (context) => MortgageLoanDialog(
          house: house,
          personID: _currentPlayerID!,
        ),
      );
    }
  }
}
