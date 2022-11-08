import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/case/general_list_item_case.dart';
import 'package:toplife/core/common_widgets/list_templates/case/list_view_item_case.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class ShopListItem extends StatelessWidget {
  final String itemName;
  final String itemDetails;
  final int itemPrice;
  final String itemImage;

  const ShopListItem({
    Key? key,
    required this.itemName,
    required this.itemDetails,
    required this.itemPrice,
    required this.itemImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return ListViewItemCase(
      onTap: () {},
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //image
          Image.asset(
            "assets/images/baby_food.jpg",
            height: 60,
            width: 60,
          ),

          const AddHorizontalSpace(width: 8.0),

          //text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  maxLines: 2,
                  style: primaryTextStyle,
                ),
                const AddVerticalSpace(height: 4.0),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    itemDetails,
                    style: shopListItemDetailsTextStyle,
                  ),
                ),
                const AddVerticalSpace(height: 10.0),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "\$$itemPrice",
                    style: primaryTextStyle.copyWith(
                        color: appTheme.colorScheme.tertiary),
                  ),
                ),
              ],
            ),
          ),

          const AddHorizontalSpace(width: 8.0),

          //button
          // OutlinedButton(
          //   onPressed: () {},
          //   child: Text("Buy"),
          // ),
        ],
      ),
    );
  }
}
