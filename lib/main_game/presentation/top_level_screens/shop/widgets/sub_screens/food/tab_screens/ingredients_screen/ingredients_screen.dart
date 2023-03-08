import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/food_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/ingredients_screen/ingredients_screen_view_model.dart';

class IngredientsScreen extends ConsumerWidget {
  const IngredientsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredientsList = ref.watch(ingredientsScreenViewModelProvider);

    return FoodListScreen(
      foodList: ingredientsList,
    );
  }
}
