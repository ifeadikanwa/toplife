import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/button/default_elevated_button.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/car/buy_car_dialog/buy_car_dialog_view_model.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/car/car_loan_dialog/car_loan_dialog.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/total_price_row.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/shop_dialog_item_info_row.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_car_quality_label.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_car_speed.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_car_type_label.dart';

class BuyCarDialog extends ConsumerWidget {
  final Car car;

  const BuyCarDialog({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DialogContainer(
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
        TotalPriceRow(
          basePrice: car.basePrice,
        ),
        const AddVerticalSpace(
          height: ShopDialogConstants.sectionVerticalSpacing,
        ),
        choiceButtons(
          context,
          ref,
        ),
      ],
    );
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
    WidgetRef ref,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DefaultElevatedButton(
          onPressed: () {
            AutoRouter.of(context).popForced();
            ref.read(buyCarDialogViewModelProvider.notifier).purchaseCar(car);
          },
          text: ShopDialogConstants.payFullAmount,
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalChoiceButtonSpacing,
        ),
        DefaultElevatedButton(
          onPressed: () {
            AutoRouter.of(context).popForced();
            //show car loan dialog
            showDismissableDialog(
              context: context,
              child: CarLoanDialog(car: car),
            );
          },
          text: ShopDialogConstants.applyForCarLoan,
        ),
      ],
    );
  }
}
