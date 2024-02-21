import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/empty_shop_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/food_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/drinks_screen/drinks_screen_view_model.dart';

class DrinksScreen extends ConsumerWidget {
  const DrinksScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drinksList = ref.watch(drinksScreenViewModelProvider);

    return (drinksList.isEmpty)
        ? const EmptyShopListScreen()
        : FoodListScreen(foodList: drinksList);
  }
}
