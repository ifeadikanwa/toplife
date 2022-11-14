import 'package:flutter/material.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/food_list_screen.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/food.dart';

class ReadyMealScreen extends StatelessWidget {
  final List<Food> readyMeals;

  const ReadyMealScreen({
    Key? key,
    required this.readyMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FoodListScreen(
      foodList: readyMeals,
    );
  }
}
