import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/shop_list_item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_name.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_size.dart';

class HouseListScreen extends StatelessWidget {
  final List<House> houseList;

  const HouseListScreen({Key? key, required this.houseList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final House house = houseList[index];
        return ShopListItem(
          itemName: getHouseName(
            buildingType: house.buildingType,
            houseDesignStyle: house.style,
          ),
          itemDetails: getHouseSize(
            bedroomCount: house.bedrooms,
            bathroomCount: house.bathrooms,
          ),
          itemPrice: house.basePrice,
          itemImage: "",
        );
      },
      separatorBuilder: (context, index) => const ListDivider(),
      itemCount: houseList.length,
    );
  }
}
