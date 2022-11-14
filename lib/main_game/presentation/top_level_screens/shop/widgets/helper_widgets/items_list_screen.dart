import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/shop_list_item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_count_label.dart';

class ItemsListScreen extends StatelessWidget {
  final List<Item> itemsList;
  const ItemsListScreen({
    Key? key,
    required this.itemsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final Item item = itemsList[index];
        return ShopListItem(
          itemName: item.name,
          itemDetails: getCountLabel(counts: item.count),
          itemPrice: item.basePrice,
          itemImage: "",
        );
      },
      separatorBuilder: (context, index) => const ListDivider(),
      itemCount: itemsList.length,
    );
  }
}
