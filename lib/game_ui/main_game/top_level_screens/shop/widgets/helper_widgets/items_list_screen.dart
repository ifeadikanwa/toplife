import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/item/buy_item_dialog.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/helper_widgets/shop_list_item.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_count_label.dart';

class ItemsListScreen extends StatelessWidget {
  final List<Item> itemsList;

  const ItemsListScreen({
    super.key,
    required this.itemsList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final Item item = itemsList[index];
        return ShopListItem(
          itemName: item.name,
          itemDetails: getCountLabel(counts: item.count),
          itemBasePrice: item.basePrice,
          itemImage: "",
          onTap: () => showDismissableDialog(
            context: context,
            child: BuyItemDialog(item: item),
          ),
        );
      },
      separatorBuilder: (context, index) => const ListDivider(),
      itemCount: itemsList.length,
    );
  }
}
