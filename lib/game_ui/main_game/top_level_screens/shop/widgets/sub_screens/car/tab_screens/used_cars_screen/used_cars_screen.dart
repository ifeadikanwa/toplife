import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/helper_widgets/empty_shop_list_screen.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/sub_screens/car/helper_widgets/car_list_screen.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/sub_screens/car/tab_screens/used_cars_screen/used_cars_screen_view_model.dart';

@RoutePage()
class UsedCarsScreen extends ConsumerWidget {
  const UsedCarsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usedCarsList = ref.watch(usedCarsScreenViewModelProvider);
    return (usedCarsList.isEmpty)
        ? const EmptyShopListScreen()
        : CarListScreen(carsList: usedCarsList);
  }
}
