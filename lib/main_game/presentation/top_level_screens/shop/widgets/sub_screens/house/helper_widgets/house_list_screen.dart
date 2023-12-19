import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/house/buy_house_dialog/buy_house_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/house/rent_house_dialog/rent_house_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/shop_list_item/shop_list_item.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_name.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_size_label.dart';

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
          itemDetails: getHouseSizeLabel(
            bedroomCount: house.bedrooms,
            bathroomCount: house.bathrooms,
          ),
          itemBasePrice: house.basePrice,
          itemImage: "",
          onTap: () => showDismissableDialog(
              context: context,
              child: (house.isForRent)
                  ? RentHouseDialog(house: house)
                  : BuyHouseDialog(house: house)),
        );
      },
      separatorBuilder: (context, index) => const ListDivider(),
      itemCount: houseList.length,
    );
  }
}
