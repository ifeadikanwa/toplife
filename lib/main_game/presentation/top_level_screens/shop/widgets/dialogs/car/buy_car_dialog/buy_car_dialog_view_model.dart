import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/car/car_loan_dialog/car_loan_dialog.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

final buyCarDialogViewModelProvider =
    FutureProvider<BuyCarDialogViewModel>((ref) async {
  //get recent
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((currentPlayer) => currentPlayer?.id),
  );
  final shopAndStorageUsecases = ref.watch(shopAndStorageUsecasesProvider);

  return BuyCarDialogViewModel(
    currentPlayerID: currentPlayerID,
    shopAndStorageUsecases: shopAndStorageUsecases,
  );
});

class BuyCarDialogViewModel {
  final int? _currentPlayerID;
  final ShopAndStorageUsecases _shopAndStorageUsecases;

  BuyCarDialogViewModel({
    required int? currentPlayerID,
    required ShopAndStorageUsecases shopAndStorageUsecases,
  })  : _currentPlayerID = currentPlayerID,
        _shopAndStorageUsecases = shopAndStorageUsecases;

  void purchaseCar(
    BuildContext context,
    Car car,
  ) {
    if (_currentPlayerID != null) {
      _shopAndStorageUsecases.purchaseCarFullyPaidUsecase.execute(
        context: context,
        car: car,
        personID: _currentPlayerID!,
      );
    }
  }

  void goToCarLoanDialog(
    BuildContext context,
    Car car,
  ) {
    if (_currentPlayerID != null) {
      showDialog(
        context: context,
        builder: (context) => CarLoanDialog(
          car: car,
          personID: _currentPlayerID!,
        ),
      );
    }
  }
}
