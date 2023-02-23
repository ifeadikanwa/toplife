import 'package:flutter/material.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/food_list_screen.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class SweetsScreen extends StatelessWidget {
  final List<Food> sweets;

  const SweetsScreen({
    Key? key,
    required this.sweets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FoodListScreen(
      foodList: sweets,
    );
  }
}
