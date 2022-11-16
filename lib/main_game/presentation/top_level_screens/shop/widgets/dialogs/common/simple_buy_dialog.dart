import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/plain_icon_button.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/helper_widgets/shop_dialog_item_info_row.dart';

class SimpleBuyDialog extends StatefulWidget {
  final String title;
  final String subtitle1;
  final String? subtitle2;
  final int basePrice;
  final void Function(int quantity) onCheckout;

  const SimpleBuyDialog({
    Key? key,
    required this.title,
    required this.subtitle1,
    this.subtitle2,
    required this.basePrice,
    required this.onCheckout,
  }) : super(key: key);

  @override
  State<SimpleBuyDialog> createState() => _SimpleBuyDialogState();
}

class _SimpleBuyDialogState extends State<SimpleBuyDialog> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return DialogContainer(
      children: [
        ShopDialogItemInfoRow(
          title: widget.title,
          subtitle1: widget.subtitle1,
          subtitle2: widget.subtitle2,
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        quantityRow(),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        const ListDivider(),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        totalRow(widget.basePrice),
        const AddVerticalSpace(
            height: ShopDialogConstants.sectionVerticalSpacing),
        ElevatedButton(
          onPressed: () {
            widget.onCheckout(quantity);
          },
          child: const Text(ShopDialogConstants.checkout),
        ),
      ],
    );
  }

  Widget quantityRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          ShopDialogConstants.quantity,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            PlainIconButton(
              onPressed: () {
                if (quantity > 1) {
                  setState(() {
                    quantity--;
                  });
                }
              },
              icon: const Icon(Icons.remove),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("$quantity"),
            ),
            PlainIconButton(
              onPressed: () {
                if (quantity < 10) {
                  setState(() {
                    quantity++;
                  });
                }
              },
              icon: const Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }

  Widget totalRow(int basePrice) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          ShopDialogConstants.total,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          "\$${quantity * basePrice}",
        ),
      ],
    );
  }
}
