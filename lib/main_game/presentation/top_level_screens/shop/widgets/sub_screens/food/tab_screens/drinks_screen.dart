import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/food_list_screen.dart';

class DrinksScreen extends StatelessWidget {
  final List<Food> drinks;

  const DrinksScreen({
    Key? key,
    required this.drinks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FoodListScreen(
      foodList: drinks,
    );
  }
}
