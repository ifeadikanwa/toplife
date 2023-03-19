import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/empty/empty_shop_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/helper_widgets/house_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/tab_screens/rental_houses_screen/rental_houses_screen_view_model.dart';

class RentalHousesScreen extends ConsumerWidget {
  const RentalHousesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rentalHousesList = ref.watch(rentalHousesScreenViewModelProvider);
    
    return (rentalHousesList.isEmpty)
        ? const EmptyShopListScreen()
        : HouseListScreen(houseList: rentalHousesList);
  }
}
