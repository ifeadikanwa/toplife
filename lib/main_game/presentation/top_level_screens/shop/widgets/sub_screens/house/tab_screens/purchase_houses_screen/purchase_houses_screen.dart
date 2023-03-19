import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/empty/empty_shop_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/helper_widgets/house_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/tab_screens/purchase_houses_screen/purchase_houses_screen_view_model.dart';

class PurchaseHousesScreen extends ConsumerWidget {
  const PurchaseHousesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchaseHousesList = ref.watch(purchaseHousesScreenViewModelProvider);

    return (purchaseHousesList.isEmpty)
        ? const EmptyShopListScreen()
        : HouseListScreen(houseList: purchaseHousesList);
  }
}
