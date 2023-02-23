import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/editable_quantity_widget.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/price_descriptor_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/static_total_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/helper_widgets/shop_dialog_item_info_row.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/house_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_building_type_label.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_storage_change_label.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_style_label.dart';

final _chosenLeaseDurationProvider = StateProvider.autoDispose<int>(
  (ref) => HouseConstants.minLeaseAgreementDuration,
);

class RentHouseDialog extends ConsumerWidget {
  final House house;
  const RentHouseDialog({
    Key? key,
    required this.house,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopAndStorageUsecases shopAndStorageUsecases =
        ref.watch(shopAndStorageUsecaseProvider);
    final Game? currentGame = ref.watch(currentGameProvider).valueOrNull;
    final int? currentHouseStorage =
        ref.watch(currentHouseStorageProvider).valueOrNull;

    return (currentGame != null && currentHouseStorage != null)
        ? DialogContainer(
            children: [
              ShopDialogItemInfoRow(
                title: getBuildingTypeLabel(house.buildingType),
                subtitle1: getHouseStyleLabel(house.style),
                subtitle2: null,
              ),
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              descriptors(currentHouseStorage: currentHouseStorage, ref: ref),
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              const ListDivider(),
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              StaticTotalRow(
                basePrice: house.basePrice * 2,
              ),
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).popForced();
                  shopAndStorageUsecases.rentHouseUsecase.execute(
                    context: context,
                    house: house,
                    personID: currentGame.currentPlayerID,
                    leaseDuration: ref.watch(_chosenLeaseDurationProvider),
                  );
                },
                child: const Text(ShopDialogConstants.signLease),
              ),
            ],
          )
        : Container();
  }

  Widget descriptors(
      {required int currentHouseStorage, required WidgetRef ref}) {
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
          value: "${house.storage} ${getHouseStorageChangeLabel(
            newHouseStorage: house.storage,
            currentHouseStorage: currentHouseStorage,
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
        leaseDurationRow(ref),
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

  Row leaseDurationRow(WidgetRef ref) {
    final int chosenLeaseDuration = ref.watch(_chosenLeaseDurationProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          TextConstants.leaseTerm,
          style: DialogConstants.dialogDescriptorTextStyle,
        ),
        const AddHorizontalSpace(width: horizontalTextBufferSpacing),
        EditableQuantity(
            text: "$chosenLeaseDuration days",
            onIncrease: () {
              if (chosenLeaseDuration < HouseConstants.maxLeaseAgreementDuration) {
                ref.read(_chosenLeaseDurationProvider.notifier).state =
                    chosenLeaseDuration + HouseConstants.leaseAgreementDurationIncrement;
              }
            },
            onDecrease: () {
              if (chosenLeaseDuration > HouseConstants.minLeaseAgreementDuration) {
                ref.read(_chosenLeaseDurationProvider.notifier).state =
                    chosenLeaseDuration - HouseConstants.leaseAgreementDurationIncrement;
              }
            })
      ],
    );
  }
}
