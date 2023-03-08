import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/shop_dialog_item_info_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/total_price_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/house/buy_house_dialog/buy_house_dialog_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_building_type_label.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_style_label.dart';

class BuyHouseDialog extends ConsumerWidget {
  final House house;

  const BuyHouseDialog({
    Key? key,
    required this.house,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buyHouseDialogViewModelDataProvider =
        ref.watch(buyHouseDialogViewModelProvider);

    return buyHouseDialogViewModelDataProvider.when(
      data: (buyHouseDialogViewModel) {
        return DialogContainer(
          children: [
            ShopDialogItemInfoRow(
              title: getBuildingTypeLabel(house.buildingType),
              subtitle1: getHouseStyleLabel(house.style),
              subtitle2: null,
            ),
            const AddVerticalSpace(
              height: ShopDialogConstants.sectionVerticalSpacing,
            ),
            descriptors(
              houseStorageChangeLabel:
                  buyHouseDialogViewModel.getStorageChangeLabel(
                newHouseStorage: house.storage,
              ),
            ),
            const AddVerticalSpace(
              height: ShopDialogConstants.sectionVerticalSpacing,
            ),
            const ListDivider(),
            const AddVerticalSpace(
              height: ShopDialogConstants.sectionVerticalSpacing,
            ),
            TotalPriceRow(
              basePrice: house.basePrice,
            ),
            const AddVerticalSpace(
              height: ShopDialogConstants.sectionVerticalSpacing,
            ),
            choiceButtons(
              context,
              buyHouseDialogViewModel,
            ),
          ],
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }

  Widget descriptors({required String houseStorageChangeLabel}) {
    return Column(
      children: [
        DescriptorRow(
          descriptor: TextConstants.bedrooms,
          value: "${house.bedrooms}",
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        DescriptorRow(
          descriptor: TextConstants.bathrooms,
          value: "${house.bathrooms}",
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        DescriptorRow(
          descriptor: TextConstants.storage,
          value: "${house.storage} $houseStorageChangeLabel",
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        DescriptorRow(
          descriptor: TextConstants.condition,
          value: "${house.condition}%",
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        DescriptorRow(
          descriptor: TextConstants.settlement,
          value: house.settlement,
        ),
      ],
    );
  }

  Widget choiceButtons(
    BuildContext context,
    BuyHouseDialogViewModel buyHouseDialogViewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            AutoRouter.of(context).popForced();
            buyHouseDialogViewModel.purchaseHouse(context, house);
          },
          child: const Text(ShopDialogConstants.payFullAmount),
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalChoiceButtonSpacing,
        ),
        ElevatedButton(
          onPressed: () {
            AutoRouter.of(context).popForced();
            buyHouseDialogViewModel.goToMortgageLoanDialog(context, house);
          },
          child: const Text(ShopDialogConstants.applyForMortgageLoan),
        ),
      ],
    );
  }
}
