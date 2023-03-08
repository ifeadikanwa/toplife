import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/editable_quantity_descriptor_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/price_descriptor_row/price_descriptor_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/shop_dialog_item_info_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/total_price_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/house/rent_house_dialog/rent_house_dialog_view_model.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_building_type_label.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_style_label.dart';

class RentHouseDialog extends ConsumerWidget {
  final House house;
  const RentHouseDialog({
    Key? key,
    required this.house,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rentHouseDialogViewModelDataProvider =
        ref.watch(rentHouseDialogViewModelProvider);

    final rentHouseDialogViewModel =
        ref.watch(rentHouseDialogViewModelProvider.notifier);

    return rentHouseDialogViewModelDataProvider.when(
      data: (leaseDuration) {
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
                chosenLeaseDuration: leaseDuration,
                rentHouseDialogViewModel: rentHouseDialogViewModel),
            const AddVerticalSpace(
              height: ShopDialogConstants.sectionVerticalSpacing,
            ),
            const ListDivider(),
            const AddVerticalSpace(
              height: ShopDialogConstants.sectionVerticalSpacing,
            ),
            TotalPriceRow(
              basePrice: house.basePrice * 2,
            ),
            const AddVerticalSpace(
              height: ShopDialogConstants.sectionVerticalSpacing,
            ),
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).popForced();
                rentHouseDialogViewModel.rentHouse(context, house);
              },
              child: const Text(ShopDialogConstants.signLease),
            ),
          ],
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }

  Widget descriptors({
    required int chosenLeaseDuration,
    required RentHouseDialogViewModel rentHouseDialogViewModel,
  }) {
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
          value:
              "${house.storage} ${rentHouseDialogViewModel.getStorageChangeLabel(
            newHouseStorage: house.storage,
          )}",
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        DescriptorRow(
          descriptor: TextConstants.settlement,
          value: house.settlement,
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        EditableQuantityDescriptorRow(
          descriptor: TextConstants.leaseTerm,
          quantity: "$chosenLeaseDuration ${TextConstants.days.toLowerCase()}",
          onIncrease: rentHouseDialogViewModel.increaseLeaseDuration,
          onDecrease: rentHouseDialogViewModel.decreaseLeaseDuration,
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        PriceDescriptorRow(
          descriptor: TextConstants.securityDeposit,
          basePrice: house.basePrice,
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        PriceDescriptorRow(
          descriptor: TextConstants.firstRent,
          basePrice: house.basePrice,
        ),
      ],
    );
  }
}
