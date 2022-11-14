import 'package:flutter/material.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/helper_widgets/car_list_screen.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';

class NewCarsScreen extends StatelessWidget {
  final List<Car> newCars;

  const NewCarsScreen({Key? key, required this.newCars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarListScreen(carsList: newCars);
  }
}
