import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/food/buy_food_dialog.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/helper_widgets/shop_list_item.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_servings_label.dart';

class FoodListScreen extends StatelessWidget {
  final List<Food> foodList;

  const FoodListScreen({
    super.key,
    required this.foodList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final Food food = foodList[index];
        return ShopListItem(
          itemName: food.name,
          itemDetails: getServingsLabel(servings: food.servings),
          itemBasePrice: food.basePrice,
          itemImage: "",
          onTap: () => showDismissableDialog(
            context: context,
            child: BuyFoodDialog(food: food),
          ),
        );
      },
      separatorBuilder: (context, index) => const ListDivider(),
      itemCount: foodList.length,
    );
  }
}
