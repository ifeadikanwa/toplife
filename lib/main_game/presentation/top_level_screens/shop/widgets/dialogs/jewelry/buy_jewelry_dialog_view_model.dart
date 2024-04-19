import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/tab_screens/natural_jewelry_screen/natural_jewelry_screen_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/tab_screens/synthetic_jewelry_screen/synthetic_jewelry_screen_view_model.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/jewelry_quality.dart';

part 'buy_jewelry_dialog_view_model.g.dart';

@riverpod
class BuyJewelryDialogViewModel extends _$BuyJewelryDialogViewModel {
  @override
  void build() {}

  void checkoutJewelry(
    Jewelry jewelry,
  ) async {
    //
    final int? currentPlayerId = await ref.read(
      currentPlayerProvider.selectAsync((data) => data?.id),
    );
    //
    if (currentPlayerId != null) {
      final bool purchaseSuccessful = await ref
          .read(shopAndStorageUsecasesProvider)
          .purchaseJewelryUsecase
          .execute(
            personID: currentPlayerId,
            jewelry: jewelry,
          );

      //if purchase is successful, ask responsible view model to remove the jewelry from the shop
      if (purchaseSuccessful) {
        (jewelry.quality == JewelryQuality.natural.name)
            ? ref
                .read(naturalJewelryScreenViewModelProvider.notifier)
                .removePurchasedJewelryFromShop(jewelry)
            : ref
                .read(syntheticJewelryScreenViewModelProvider.notifier)
                .removePurchasedJewelryFromShop(jewelry);
      }
    }
  }
}
