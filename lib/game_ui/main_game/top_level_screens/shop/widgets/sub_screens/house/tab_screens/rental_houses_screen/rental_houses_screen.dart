import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/helper_widgets/empty_shop_list_screen.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/sub_screens/house/helper_widgets/house_list_screen.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/sub_screens/house/tab_screens/rental_houses_screen/rental_houses_screen_view_model.dart';

@RoutePage()
class RentalHousesScreen extends ConsumerWidget {
  const RentalHousesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rentalHousesListProvider =
        ref.watch(rentalHousesScreenViewModelProvider);

    return rentalHousesListProvider.when(
      data: (rentalHousesList) => (rentalHousesList.isEmpty)
          ? const EmptyShopListScreen()
          : HouseListScreen(houseList: rentalHousesList),
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }
}
