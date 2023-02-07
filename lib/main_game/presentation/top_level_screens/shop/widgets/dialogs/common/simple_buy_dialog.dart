import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/utils/money/get_currency_label_from_currency_string.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/editable_quantity_widget.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/helper_widgets/shop_dialog_item_info_row.dart';
import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';

class SimpleBuyDialog extends ConsumerStatefulWidget {
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
  ConsumerState<SimpleBuyDialog> createState() => _SimpleBuyDialogState();
}

class _SimpleBuyDialogState extends ConsumerState<SimpleBuyDialog> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final String? currentCurrency =
        ref.watch(currentPlayerCurrencyProvider).valueOrNull;
    final String? currentPlayerCountry =
        ref.watch(currentPlayerCountryProvider).valueOrNull;

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
        totalRow(
          basePrice: widget.basePrice,
          playerCountry: currentPlayerCountry,
          playerCurrency: currentCurrency,
        ),
        const AddVerticalSpace(
            height: ShopDialogConstants.sectionVerticalSpacing),
        ElevatedButton(
          onPressed: () {
            AutoRouter.of(context).popForced();
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
        EditableQuantity(
          text: "$quantity",
          onIncrease: () {
            if (quantity < 10) {
              setState(() {
                quantity++;
              });
            }
          },
          onDecrease: () {
            if (quantity > 1) {
              setState(() {
                quantity--;
              });
            }
          },
        )
      ],
    );
  }

  Widget totalRow({
    required int basePrice,
    required String? playerCountry,
    required String? playerCurrency,
  }) {
    final int totalPrice = playerCountry != null
        ? getCountryEconomyAdjustedPrice(
            country: playerCountry,
            basePrice: basePrice,
          )
        : basePrice;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          ShopDialogConstants.total,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          "${getCurrencyLabelFromCurrencyString(playerCurrency)}${quantity * totalPrice}",
        ),
      ],
    );
  }
}
