import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/total_price_row.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/shop_dialog_item_info_row.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/jewelry/buy_jewelry_dialog_view_model.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_carat_label.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_jewelry_name.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_jewelry_quality_label.dart';

class BuyJewelryDialog extends ConsumerWidget {
  final Jewelry jewelry;

  const BuyJewelryDialog({
    super.key,
    required this.jewelry,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DialogContainer(
      children: [
        ShopDialogItemInfoRow(
          title: getJewelryName(
            jewel: jewelry.jewel,
            type: jewelry.type,
          ),
          subtitle1:
              "${TextConstants.quality}: ${getJewelryQualityLabel(quality: jewelry.quality)}",
          subtitle2: getCaratLabel(jewel: jewelry.jewel, carat: jewelry.carat),
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        const ListDivider(),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        TotalPriceRow(
          basePrice: jewelry.basePrice,
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        ElevatedButton(
          onPressed: () {
            AutoRouter.of(context).popForced();
            ref
                .read(buyJewelryDialogViewModelProvider.notifier)
                .checkoutJewelry(jewelry);
          },
          child: const Text(
            ShopDialogConstants.checkout,
          ),
        )
      ],
    );
  }
}
