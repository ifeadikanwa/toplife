import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/helper_widgets/jewelry_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/tab_screens/synthetic_jewelry_screen/synthetic_jewelry_screen_view_model.dart';

class SyntheticJewelryScreen extends ConsumerWidget {
  const SyntheticJewelryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syntheticJewelriesList =
        ref.watch(syntheticJewelryScreenViewModelProvider);

    return JewelryListScreen(jewelryList: syntheticJewelriesList);
  }
}
