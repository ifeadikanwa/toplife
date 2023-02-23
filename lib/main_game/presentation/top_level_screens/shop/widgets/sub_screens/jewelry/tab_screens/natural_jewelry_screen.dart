import 'package:flutter/material.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/helper_widgets/jewelry_list_screen.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class NaturalJewelryScreen extends StatelessWidget {
  final List<Jewelry> naturalJewelries;

  const NaturalJewelryScreen({Key? key, required this.naturalJewelries})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JewelryListScreen(jewelryList: naturalJewelries);
  }
}
