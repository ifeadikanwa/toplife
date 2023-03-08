import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/food_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/ready_meals_screen/ready_meals_screen_view_model.dart';

class ReadyMealScreen extends ConsumerWidget {
  const ReadyMealScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readyMealsList = ref.watch(readyMealsScreenViewModelProvider);

    return FoodListScreen(
      foodList: readyMealsList,
    );
  }
}
