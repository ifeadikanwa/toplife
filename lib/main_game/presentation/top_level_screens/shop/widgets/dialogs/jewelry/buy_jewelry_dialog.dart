import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/static_total_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/helper_widgets/shop_dialog_item_info_row.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_carat_label.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_jewelry_name.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_jewelry_quality_label.dart';

class BuyJewelryDialog extends ConsumerWidget {
  final Jewelry jewelry;
  const BuyJewelryDialog({
    super.key,
    required this.jewelry,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopAndStorageUsecases shopAndStorageUsecases =
        ref.watch(shopAndStorageUsecaseProvider);
    final currentGame = ref.watch(currentGameProvider).valueOrNull;

    return (currentGame != null)
        ? DialogContainer(
            children: [
              ShopDialogItemInfoRow(
                title: getJewelryName(
                  jewel: jewelry.jewel,
                  type: jewelry.type,
                ),
                subtitle1:
                    "${TextConstants.quality}: ${getJewelryQualityLabel(quality: jewelry.quality)}",
                subtitle2:
                    getCaratLabel(jewel: jewelry.jewel, carat: jewelry.carat),
              ),
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              const ListDivider(),
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              StaticTotalRow(
                basePrice: jewelry.basePrice,
              ),
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).popForced();
                  shopAndStorageUsecases.purchaseJewelryUsecase.execute(
                    context: context,
                    jewelry: jewelry,
                    personID: currentGame.currentPlayerID,
                  );
                },
                child: const Text(
                  ShopDialogConstants.checkout,
                ),
              )
            ],
          )
        : Container();
  }
}
