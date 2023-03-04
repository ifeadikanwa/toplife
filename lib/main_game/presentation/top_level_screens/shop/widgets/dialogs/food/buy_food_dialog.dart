import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/simple_buy_dialog.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_servings_label.dart';

class BuyFoodDialog extends ConsumerWidget {
  final Food food;
  const BuyFoodDialog({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopAndStorageUsecases shopAndStorageUsecases =
        ref.watch(shopAndStorageUsecasesProvider);
    final currentGame = ref.watch(currentGameProvider).valueOrNull;

    return (currentGame != null)
        ? SimpleBuyDialog(
            title: food.name,
            subtitle1: "${TextConstants.nutrition}: ${food.nutrition}",
            subtitle2: getServingsLabel(servings: food.servings),
            basePrice: food.basePrice,
            onCheckout: (int quantity) {
              shopAndStorageUsecases.purchaseFoodUsecase.execute(
                context: context,
                personID: currentGame.currentPlayerID,
                food: food,
                quantity: quantity,
              );
            },
          )
        : Container();
  }
}
