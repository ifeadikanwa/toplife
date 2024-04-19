import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/empty_shop_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/food_list_screen.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/shop.dart';

@RoutePage()
class ReadyMealScreen extends StatelessWidget {
  const ReadyMealScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Food> readyMealsList = Shop.readyMealsList;

    return (readyMealsList.isEmpty)
        ? const EmptyShopListScreen()
        : FoodListScreen(foodList: readyMealsList);
  }
}
