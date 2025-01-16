import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/sub_screens/car/tab_screens/new_cars_screen/new_cars_screen_view_model.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/sub_screens/car/tab_screens/used_cars_screen/used_cars_screen_view_model.dart';

part 'buy_car_dialog_view_model.g.dart';

@riverpod
class BuyCarDialogViewModel extends _$BuyCarDialogViewModel {
  @override
  void build() {}

  void purchaseCar(
    Car car,
  ) async {
    //
    final int? currentPlayerId = await ref.read(
      currentPlayerProvider.selectAsync((data) => data?.id),
    );

    //
    if (currentPlayerId != null) {
      //
      final bool purchaseSuccessful = await ref
          .read(shopAndStorageUsecasesProvider)
          .purchaseCarFullyPaidUsecase
          .execute(
            car: car,
            personID: currentPlayerId,
          );

      //if purchase is successful, ask responsible view model to remove the car from the shop
      if (purchaseSuccessful) {
        //new cars have 100% condition at purchase
        (car.maxConditionAtPurchase == defaultMaxStatsValue)
            ? ref
                .read(newCarsScreenViewModelProvider.notifier)
                .removePurchasedCarFromShop(car)
            : ref
                .read(usedCarsScreenViewModelProvider.notifier)
                .removePurchasedCarFromShop(car);
      }
    }
  }
}
