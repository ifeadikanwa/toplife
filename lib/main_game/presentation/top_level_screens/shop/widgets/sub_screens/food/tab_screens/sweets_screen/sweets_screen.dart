import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/empty_shop_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/food_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/sweets_screen/sweets_screen_view_model.dart';

class SweetsScreen extends ConsumerWidget {
  const SweetsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sweetsList = ref.watch(sweetsScreenViewModelProvider);

    return (sweetsList.isEmpty)
        ? const EmptyShopListScreen()
        : FoodListScreen(foodList: sweetsList);
  }
}
