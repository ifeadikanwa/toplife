import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/button/default_elevated_button.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/editable_quantity_descriptor_row.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/price_descriptor_row/price_descriptor_row.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/shop_dialog_item_info_row.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/total_price_row.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/house/rent_house_dialog/rent_house_dialog_view_model.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_building_type_label.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_house_style_label.dart';

class RentHouseDialog extends ConsumerWidget {
  final House house;

  const RentHouseDialog({
    super.key,
    required this.house,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RentHouseDialogViewModelProvider viewModelProvider =
        rentHouseDialogViewModelProvider(
      newHouseBasePrice: house.basePrice,
      newHouseStorage: house.storage,
    );

    final rentHouseDialogViewModel = ref.watch(viewModelProvider);

    return rentHouseDialogViewModel.when(
      data: (rentHouseDialogData) => (rentHouseDialogData == null)
          ? const SizedBox()
          : DialogContainer(
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
                  rentHouseDialogData: rentHouseDialogData,
                  viewModelProvider: viewModelProvider,
                  ref: ref,
                ),
                const AddVerticalSpace(
                  height: ShopDialogConstants.sectionVerticalSpacing,
                ),
                const ListDivider(),
                const AddVerticalSpace(
                  height: ShopDialogConstants.sectionVerticalSpacing,
                ),
                TotalPriceRow(
                  basePrice: rentHouseDialogData.totalRentBasePrice,
                ),
                const AddVerticalSpace(
                  height: ShopDialogConstants.sectionVerticalSpacing,
                ),
                DefaultElevatedButton(
                  onPressed: () {
                    AutoRouter.of(context).popForced();
                    ref.read(viewModelProvider.notifier).rentHouse(house);
                  },
                  text: ShopDialogConstants.signLease,
                ),
              ],
            ),
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }

  Widget descriptors({
    required RentHouseDialogData rentHouseDialogData,
    required RentHouseDialogViewModelProvider viewModelProvider,
    required WidgetRef ref,
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
              "${house.storage} ${rentHouseDialogData.homeStorageChangeLabel}",
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        DescriptorRow(
          descriptor: TextConstants.state,
          value: house.state,
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
          quantity:
              "${rentHouseDialogData.chosenLeaseDuration} ${TextConstants.days.toLowerCase()}",
          onIncrease:
              ref.read(viewModelProvider.notifier).increaseLeaseDuration,
          onDecrease:
              ref.read(viewModelProvider.notifier).decreaseLeaseDuration,
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
