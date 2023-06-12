import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/car/car_loan_dialog/car_loan_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/tab_screens/new_cars_screen/new_cars_screen_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/tab_screens/used_cars_screen/used_cars_screen_view_model.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

final buyCarDialogViewModelProvider =
    FutureProvider<BuyCarDialogViewModel>((ref) async {
  //get recent
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((currentPlayer) => currentPlayer?.id),
  );
  final shopAndStorageUsecases = ref.watch(shopAndStorageUsecasesProvider);
  final NewCarsScreenViewModel newCarsScreenViewModel =
      ref.watch(newCarsScreenViewModelProvider.notifier);
  final UsedCarsScreenViewModel usedCarsScreenViewModel =
      ref.watch(usedCarsScreenViewModelProvider.notifier);

  return BuyCarDialogViewModel(
    currentPlayerID: currentPlayerID,
    shopAndStorageUsecases: shopAndStorageUsecases,
    newCarsScreenViewModel: newCarsScreenViewModel,
    usedCarsScreenViewModel: usedCarsScreenViewModel,
  );
});

class BuyCarDialogViewModel {
  final int? _currentPlayerID;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final NewCarsScreenViewModel _newCarsScreenViewModel;
  final UsedCarsScreenViewModel _usedCarsScreenViewModel;

  BuyCarDialogViewModel({
    required int? currentPlayerID,
    required ShopAndStorageUsecases shopAndStorageUsecases,
    required NewCarsScreenViewModel newCarsScreenViewModel,
    required UsedCarsScreenViewModel usedCarsScreenViewModel,
  })  : _currentPlayerID = currentPlayerID,
        _shopAndStorageUsecases = shopAndStorageUsecases,
        _newCarsScreenViewModel = newCarsScreenViewModel,
        _usedCarsScreenViewModel = usedCarsScreenViewModel;

  void purchaseCar(
    BuildContext context,
    Car car,
  ) async {
    if (_currentPlayerID != null) {
      final bool purchaseSuccessful =
          await _shopAndStorageUsecases.purchaseCarFullyPaidUsecase.execute(
        context: context,
        car: car,
        personID: _currentPlayerID!,
      );

      //if purchase is successful, ask responsible view model to remove the car from the shop
      if (purchaseSuccessful) {
        //new cars have 100% condition at purchase
        (car.maxConditionAtPurchase == defaultMaxStatsValue)
            ? _newCarsScreenViewModel.removePurchasedCarFromShop(car)
            : _usedCarsScreenViewModel.removePurchasedCarFromShop(car);
      }
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
