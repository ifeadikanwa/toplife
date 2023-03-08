import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/car/buy_car_dialog/buy_car_dialog_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/total_price_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/shop_dialog_item_info_row.dart';
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
    final buyCarDialogViewModelDataProvider =
        ref.watch(buyCarDialogViewModelProvider);

    return buyCarDialogViewModelDataProvider.when(
      data: (buyCarDialogViewModel) {
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
              buyCarDialogViewModel,
            ),
          ],
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
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
    BuyCarDialogViewModel buyCarDialogViewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            AutoRouter.of(context).popForced();
            buyCarDialogViewModel.purchaseCar(context, car);
          },
          child: const Text(ShopDialogConstants.payFullAmount),
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalChoiceButtonSpacing,
        ),
        ElevatedButton(
          onPressed: () {
            AutoRouter.of(context).popForced();
            buyCarDialogViewModel.goToCarLoanDialog(context, car);
          },
          child: const Text(ShopDialogConstants.applyForCarLoan),
        ),
      ],
    );
  }
}
