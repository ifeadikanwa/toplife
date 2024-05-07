import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

part 'buy_food_dialog_view_model.g.dart';

@riverpod
class BuyFoodDialogViewModel extends _$BuyFoodDialogViewModel {
  @override
  void build() {}

  void checkoutFood(
    Food food,
    int quantity,
  ) async {
    final int? currentPlayerId = await ref.read(
      currentPlayerProvider.selectAsync((data) => data?.id),
    );

    if (currentPlayerId != null) {
      ref.read(shopAndStorageUsecasesProvider).purchaseFoodUsecase.execute(
            personID: currentPlayerId,
            food: food,
            quantity: quantity,
          );
    }
  }
}
