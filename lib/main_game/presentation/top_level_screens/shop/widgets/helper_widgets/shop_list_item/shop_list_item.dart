import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/list_templates/case/list_view_item_case.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/shop_list_item/shop_list_item_view_model.dart';

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
    final shopListItemViewModel =
        ref.watch(shopListItemViewModelProvider.notifier);
    final shopListItemViewModelDataProvider =
        ref.watch(shopListItemViewModelProvider);

    return shopListItemViewModelDataProvider.when(
      data: (currency) {
        return ListViewItemCase(
          onTap: onTap,
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
                        "$currency${shopListItemViewModel.getEconomyAdjustedItemPrice(itemBasePrice: itemBasePrice)}",
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
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }
}
