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
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/car/car_loan_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/static_total_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/helper_widgets/shop_dialog_item_info_row.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_quality_label.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_speed.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_type_label.dart';

class BuyCarDialog extends ConsumerWidget {
  final Car car;
  const BuyCarDialog({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopAndStorageUsecases shopAndStorageUsecases =
        ref.watch(shopAndStorageUsecaseProvider);
    final Game? currentGame = ref.watch(fetchCurrentGameProvider).valueOrNull;

    return (currentGame != null)
        ? DialogContainer(
            children: [
              ShopDialogItemInfoRow(
                title: car.name,
                subtitle1: getCarTypeLabel(car.type),
                subtitle2: null,
              ),
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              descriptors(),
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              const ListDivider(),
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              StaticTotalRow(
                basePrice: car.basePrice,
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

  Widget descriptors() {
    return Column(
      children: [
        DescriptorRow(
          descriptor: TextConstants.condition,
          value: "${car.maxConditionAtPurchase}%",
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        DescriptorRow(
          descriptor: TextConstants.speed,
          value:
              "${getCarSpeed(percentageTravel: car.percentageOfTravelTime)}%",
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        DescriptorRow(
          descriptor: TextConstants.fuelTank,
          value: "${car.fuelTank}%",
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        DescriptorRow(
          descriptor: TextConstants.quality,
          value: getCarQualityLabel(car.quality),
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
            shopAndStorageUsecases.purchaseCarFullyPaidUsecase.execute(
              context: context,
              car: car,
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
              builder: (context) => CarLoanDialog(
                car: car,
                personID: personID,
              ),
            );
          },
          child: const Text(ShopDialogConstants.applyForCarLoan),
        ),
      ],
    );
  }
}
