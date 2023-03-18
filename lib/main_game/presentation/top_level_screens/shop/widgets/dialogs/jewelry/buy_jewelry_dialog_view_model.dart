import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/tab_screens/natural_jewelry_screen/natural_jewelry_screen_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/tab_screens/synthetic_jewelry_screen/synthetic_jewelry_screen_view_model.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/jewelry_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

final buyJewelryDialogViewModelProvider =
    FutureProvider<BuyJewelryDialogViewModel>((ref) async {
  //get recent
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((currentPlayer) => currentPlayer?.id),
  );
  final shopAndStorageUsecases = ref.watch(shopAndStorageUsecasesProvider);
  final NaturalJewelryScreenViewModel naturalJewelryScreenViewModel =
      ref.watch(naturalJewelryScreenViewModelProvider.notifier);

  final SyntheticJewelryScreenViewModel syntheticJewelryScreenViewModel =
      ref.watch(syntheticJewelryScreenViewModelProvider.notifier);

  return BuyJewelryDialogViewModel(
    currentPlayerID: currentPlayerID,
    shopAndStorageUsecases: shopAndStorageUsecases,
    naturalJewelryScreenViewModel: naturalJewelryScreenViewModel,
    syntheticJewelryScreenViewModel: syntheticJewelryScreenViewModel,
  );
});

class BuyJewelryDialogViewModel {
  final int? _currentPlayerID;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final NaturalJewelryScreenViewModel _naturalJewelryScreenViewModel;
  final SyntheticJewelryScreenViewModel _syntheticJewelryScreenViewModel;

  BuyJewelryDialogViewModel({
    required int? currentPlayerID,
    required ShopAndStorageUsecases shopAndStorageUsecases,
    required NaturalJewelryScreenViewModel naturalJewelryScreenViewModel,
    required SyntheticJewelryScreenViewModel syntheticJewelryScreenViewModel,
  })  : _currentPlayerID = currentPlayerID,
        _shopAndStorageUsecases = shopAndStorageUsecases,
        _naturalJewelryScreenViewModel = naturalJewelryScreenViewModel,
        _syntheticJewelryScreenViewModel = syntheticJewelryScreenViewModel;

  void checkoutJewelry(
    BuildContext context,
    Jewelry jewelry,
  ) async {
    if (_currentPlayerID != null) {
      final bool purchaseSuccessful =
          await _shopAndStorageUsecases.purchaseJewelryUsecase.execute(
        context: context,
        personID: _currentPlayerID!,
        jewelry: jewelry,
      );

      //if purchase is successful, ask responsible view model to remove the jewelry from the shop
      if (purchaseSuccessful) {
        (jewelry.quality == JewelryQuality.natural.name)
            ? _naturalJewelryScreenViewModel
                .removePurchasedJewelryFromShop(jewelry)
            : _syntheticJewelryScreenViewModel
                .removePurchasedJewelryFromShop(jewelry);
      }
    }
  }
}
