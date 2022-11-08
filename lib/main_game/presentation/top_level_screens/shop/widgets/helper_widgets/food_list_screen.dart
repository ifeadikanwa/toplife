import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/shop_list_item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/food.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_servings_label.dart';

class FoodListScreen extends StatelessWidget {
  final List<Food> foodList;

  const FoodListScreen({
    Key? key,
    required this.foodList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final Food food = foodList[index];
        return ShopListItem(
          itemName: food.name,
          itemDetails: getServingsLabel(servings: food.servings),
          itemPrice: food.basePrice,
          itemImage: "",
        );
      },
      separatorBuilder: (context, index) => const ListDivider(),
      itemCount: foodList.length,
    );
  }
}
