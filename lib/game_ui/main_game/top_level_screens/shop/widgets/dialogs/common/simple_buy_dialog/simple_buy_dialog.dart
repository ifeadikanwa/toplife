import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/button/default_elevated_button.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/editable_quantity_descriptor_row.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/simple_buy_dialog/simple_buy_dialog_view_model.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/total_price_row.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/shop_dialog_item_info_row.dart';

class SimpleBuyDialog extends ConsumerWidget {
  final String title;
  final String subtitle1;
  final String? subtitle2;
  final int basePrice;
  final void Function(int quantity) onCheckout;

  const SimpleBuyDialog({
    super.key,
    required this.title,
    required this.subtitle1,
    this.subtitle2,
    required this.basePrice,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int quantity = ref.watch(simpleBuyDialogViewModelProvider);

    return DialogContainer(
      children: [
        ShopDialogItemInfoRow(
          title: title,
          subtitle1: subtitle1,
          subtitle2: subtitle2,
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        EditableQuantityDescriptorRow(
          descriptor: ShopDialogConstants.quantity,
          quantity: "$quantity",
          onIncrease: ref
              .read(simpleBuyDialogViewModelProvider.notifier)
              .increaseQuantity,
          onDecrease: ref
              .read(simpleBuyDialogViewModelProvider.notifier)
              .decreaseQuantity,
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        const ListDivider(),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        TotalPriceRow(basePrice: quantity * basePrice),
        const AddVerticalSpace(
            height: ShopDialogConstants.sectionVerticalSpacing),
        DefaultElevatedButton(
          onPressed: () {
            AutoRouter.of(context).popForced();
            onCheckout(quantity);
          },
          text: ShopDialogConstants.checkout,
        ),
      ],
    );
  }
}
