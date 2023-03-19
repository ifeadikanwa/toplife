import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/empty/empty_shop_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/helper_widgets/jewelry_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/tab_screens/natural_jewelry_screen/natural_jewelry_screen_view_model.dart';

class NaturalJewelryScreen extends ConsumerWidget {
  const NaturalJewelryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final naturalJewelriesList =
        ref.watch(naturalJewelryScreenViewModelProvider);

    return (naturalJewelriesList.isEmpty)
        ? const EmptyShopListScreen()
        :  JewelryListScreen(jewelryList: naturalJewelriesList);
  }
}
