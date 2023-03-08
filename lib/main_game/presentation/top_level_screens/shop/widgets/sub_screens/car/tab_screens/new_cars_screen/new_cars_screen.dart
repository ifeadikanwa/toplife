import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/helper_widgets/car_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/tab_screens/new_cars_screen/new_cars_screen_view_model.dart';

class NewCarsScreen extends ConsumerWidget {
  const NewCarsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newCarsList = ref.watch(newCarsScreenViewModelProvider);
    return CarListScreen(carsList: newCarsList);
  }
}
