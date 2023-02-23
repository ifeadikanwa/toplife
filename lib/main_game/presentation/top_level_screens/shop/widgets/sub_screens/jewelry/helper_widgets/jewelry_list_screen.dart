import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/jewelry/buy_jewelry_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/shop_list_item.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_carat_label.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_jewelry_name.dart';

class JewelryListScreen extends StatelessWidget {
  final List<Jewelry> jewelryList;
  const JewelryListScreen({Key? key, required this.jewelryList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final Jewelry jewelry = jewelryList[index];
        return ShopListItem(
          itemName: getJewelryName(jewel: jewelry.jewel, type: jewelry.type),
          itemDetails:
              getCaratLabel(jewel: jewelry.jewel, carat: jewelry.carat),
          itemPrice: jewelry.basePrice,
          itemImage: "",
          onTap: () => showDialog(
            context: context,
            builder: (context) => BuyJewelryDialog(jewelry: jewelry),
          ),
        );
      },
      separatorBuilder: (context, index) => const ListDivider(),
      itemCount: jewelryList.length,
    );
  }
}
