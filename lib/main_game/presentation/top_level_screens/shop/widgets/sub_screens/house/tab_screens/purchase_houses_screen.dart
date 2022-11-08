import 'package:flutter/material.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/helper_widgets/house_list_screen.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';

class PurchaseHousesScreen extends StatelessWidget {
  final List<House> purchaseHouses;
  const PurchaseHousesScreen({Key? key, required this.purchaseHouses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HouseListScreen(houseList: purchaseHouses);
  }
}
