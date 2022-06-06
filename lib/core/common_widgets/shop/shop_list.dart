import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/shop/shop_list_item.dart';

class ShopList extends StatelessWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 2.0,
        children: List.generate(8, (index) {
          return const ShopListItem();
        }),
      ),
    );
  }
}
