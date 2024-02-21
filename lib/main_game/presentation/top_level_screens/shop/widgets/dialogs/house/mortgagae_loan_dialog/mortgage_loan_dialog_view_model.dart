import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/recurring_bill/recurring_bill_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/tab_screens/purchase_houses_screen/purchase_houses_screen_view_model.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

final mortgageLoanDialogViewModelProvider =
    FutureProvider.autoDispose<MortgageLoanDialogViewModel>((ref) async {
  //get recent
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((currentPlayer) => currentPlayer?.id),
  );
  final bool hasExistingMortgage = currentPlayerID != null
      ? await ref
          .watch(recurringBillUsecasesProvider)
          .checkIfThereIsAnExistingMortgageLoanUsecase
          .execute(personID: currentPlayerID)
      : true;

  final shopAndStorageUsecases = ref.watch(shopAndStorageUsecasesProvider);
  final PurchaseHousesScreenViewModel purchaseHousesScreenViewModel =
      ref.watch(purchaseHousesScreenViewModelProvider.notifier);

  return MortgageLoanDialogViewModel(
    shopAndStorageUsecases: shopAndStorageUsecases,
    hasExistingMortgage: hasExistingMortgage,
    purchaseHousesScreenViewModel: purchaseHousesScreenViewModel,
  );
});

class MortgageLoanDialogViewModel {
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final bool _hasExistingMortgage;
  final PurchaseHousesScreenViewModel _purchaseHousesScreenViewModel;

  MortgageLoanDialogViewModel({
    required ShopAndStorageUsecases shopAndStorageUsecases,
    required bool hasExistingMortgage,
    required PurchaseHousesScreenViewModel purchaseHousesScreenViewModel,
  })  : _shopAndStorageUsecases = shopAndStorageUsecases,
        _hasExistingMortgage = hasExistingMortgage,
        _purchaseHousesScreenViewModel = purchaseHousesScreenViewModel;

  bool getHasExistingMortgage() {
    return _hasExistingMortgage;
  }

  void applyForMortgageLoan(
    BuildContext context,
    int personID,
    House house,
    int downPaymentPercentage,
  ) async {
    final bool purchaseSuccessful =
        await _shopAndStorageUsecases.purchaseHouseWithLoanUsecase.execute(
      context: context,
      house: house,
      downPaymentPercentage: downPaymentPercentage,
      personID: personID,
    );

    if (purchaseSuccessful) {
      _purchaseHousesScreenViewModel.removePurchasedHouseFromShop(house);
    }
  }
}
