import 'package:flutter/material.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/helper_widgets/house_list_screen.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class RentalHousesScreen extends StatelessWidget {
  final List<House> rentalHouses;
  const RentalHousesScreen({Key? key, required this.rentalHouses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HouseListScreen(houseList: rentalHouses);
  }
}
