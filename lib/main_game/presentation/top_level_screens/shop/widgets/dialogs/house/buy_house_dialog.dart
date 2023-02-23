import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/house/mortgage_loan_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/static_total_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/helper_widgets/shop_dialog_item_info_row.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_building_type_label.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_storage_change_label.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_style_label.dart';



class BuyHouseDialog extends ConsumerWidget {
  final House house;

  const BuyHouseDialog({
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
              descriptors(currentHouseStorage: currentHouseStorage),
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              const ListDivider(),
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              StaticTotalRow(
                basePrice: house.basePrice,
              ),
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              choiceButtons(
                context,
                shopAndStorageUsecases,
                currentGame.currentPlayerID,
              ),
            ],
          )
        : Container();
  }

  Widget descriptors({required int currentHouseStorage}) {
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
    ShopAndStorageUsecases shopAndStorageUsecases,
    int personID,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            AutoRouter.of(context).popForced();
            shopAndStorageUsecases.purchaseHouseFullyPaidUsecase.execute(
              context: context,
              house: house,
              personID: personID,
            );
          },
          child: const Text(ShopDialogConstants.payFullAmount),
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalChoiceButtonSpacing,
        ),
        ElevatedButton(
          onPressed: () {
            AutoRouter.of(context).popForced();
            showDialog(
              context: context,
              builder: (context) => MortgageLoanDialog(
                house: house,
                personID: personID,
              ),
            );
          },
          child: const Text(ShopDialogConstants.applyForMortgageLoan),
        ),
      ],
    );
  }
}
