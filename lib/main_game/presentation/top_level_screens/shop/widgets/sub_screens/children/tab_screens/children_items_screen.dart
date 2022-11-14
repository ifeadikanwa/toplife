import 'package:flutter/material.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/items_list_screen.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/item.dart';

class ChildrenItemsScreen extends StatelessWidget {
  final List<Item> childrenItems;
  const ChildrenItemsScreen({Key? key, required this.childrenItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemsListScreen(itemsList: childrenItems);
  }
}
