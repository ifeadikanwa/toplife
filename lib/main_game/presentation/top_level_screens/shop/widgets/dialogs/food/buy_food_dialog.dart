import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/simple_buy_dialog/simple_buy_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/food/buy_food_dialog_view_model.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_servings_label.dart';

class BuyFoodDialog extends ConsumerWidget {
  final Food food;
  const BuyFoodDialog({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buyFoodViewModelDataProvider =
        ref.watch(buyFoodDialogViewModelProvider);

    return buyFoodViewModelDataProvider.when(
      data: (buyFoodViewModel) {
        return SimpleBuyDialog(
          title: food.name,
          subtitle1: "${TextConstants.nutrition}: ${food.nutrition}",
          subtitle2: getServingsLabel(servings: food.servings),
          basePrice: food.basePrice,
          onCheckout: (int quantity) {
            buyFoodViewModel.checkoutFood(context, food, quantity);
          },
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }
}
