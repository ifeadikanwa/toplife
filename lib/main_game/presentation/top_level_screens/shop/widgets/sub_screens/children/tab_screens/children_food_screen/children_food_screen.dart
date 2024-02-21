import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/empty_shop_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/food_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/children/tab_screens/children_food_screen/children_food_screen_view_model.dart';

class ChildrenFoodScreen extends ConsumerWidget {
  const ChildrenFoodScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenFoodList = ref.watch(childrenFoodScreenViewModelProvider);
    return (childrenFoodList.isEmpty)
        ? const EmptyShopListScreen()
        : FoodListScreen(foodList: childrenFoodList);
  }
}
