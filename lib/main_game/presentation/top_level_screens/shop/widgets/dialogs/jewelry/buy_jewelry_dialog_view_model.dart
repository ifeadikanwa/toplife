import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

final buyJewelryDialogViewModelProvider =
    FutureProvider<BuyJewelryDialogViewModel>((ref) async {
  //get recent
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((currentPlayer) => currentPlayer?.id),
  );
  final shopAndStorageUsecases = ref.watch(shopAndStorageUsecasesProvider);

  return BuyJewelryDialogViewModel(
    currentPlayerID: currentPlayerID,
    shopAndStorageUsecases: shopAndStorageUsecases,
  );
});

class BuyJewelryDialogViewModel {
  final int? _currentPlayerID;
  final ShopAndStorageUsecases _shopAndStorageUsecases;

  BuyJewelryDialogViewModel({
    required int? currentPlayerID,
    required ShopAndStorageUsecases shopAndStorageUsecases,
  })  : _currentPlayerID = currentPlayerID,
        _shopAndStorageUsecases = shopAndStorageUsecases;

  void checkoutJewelry(
    BuildContext context,
    Jewelry jewelry,
  ) {
    if (_currentPlayerID != null) {
      _shopAndStorageUsecases.purchaseJewelryUsecase.execute(
        context: context,
        personID: _currentPlayerID!,
        jewelry: jewelry,
      );
    }
  }
}
