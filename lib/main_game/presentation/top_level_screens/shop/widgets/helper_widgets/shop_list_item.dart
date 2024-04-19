import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/player_and_game/formatted_money_provider.dart';
import 'package:toplife/core/common_widgets/list_templates/case/list_view_item_case.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class ShopListItem extends ConsumerWidget {
  final String itemName;
  final String itemDetails;
  final int itemBasePrice;
  final String itemImage;
  final void Function() onTap;

  const ShopListItem({
    Key? key,
    required this.itemName,
    required this.itemDetails,
    required this.itemBasePrice,
    required this.itemImage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = Theme.of(context);
    //
    final formattedPriceProvider = ref.watch(
      formattedMoneyProvider(
        amount: itemBasePrice,
        adjustToEconomy: true,
      ),
    );

    return formattedPriceProvider.when(
      data: (formattedPrice) {
        return ListViewItemCase(
          onTap: onTap,
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //image
              Image.asset(
                "assets/images/houses/townhouse_500px.png",
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
                        formattedPrice,
                        style: primaryTextStyle.copyWith(
                          color: appTheme.colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
