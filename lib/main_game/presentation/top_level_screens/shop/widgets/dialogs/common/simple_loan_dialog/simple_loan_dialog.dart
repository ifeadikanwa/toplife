import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_slider.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/simple_loan_dialog/simple_loan_dialog_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';

class SimpleLoanDialog extends ConsumerWidget {
  final String loanApplicationTitle;
  final String itemName;
  final BillType billType;
  final int basePrice;
  final bool useMultipleLoanDownPaymentRange;
  final void Function(int downPaymentPercentage) onApply;

  const SimpleLoanDialog({
    Key? key,
    required this.loanApplicationTitle,
    required this.itemName,
    required this.billType,
    required this.basePrice,
    this.useMultipleLoanDownPaymentRange = false,
    required this.onApply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simpleLoanDialogViewModelDataProvider = ref.watch(
        simpleLoanDialogViewModelProvider(useMultipleLoanDownPaymentRange));

    final simpleLoanDialogViewModel = ref.watch(
        simpleLoanDialogViewModelProvider(useMultipleLoanDownPaymentRange)
            .notifier);

    return simpleLoanDialogViewModelDataProvider.when(
      data: (downPaymentPercentage) {
        return DialogContainer(
          title: DialogTitleText(
            text: loanApplicationTitle,
          ),
          children: [
            //item
            itemNameRow(),

            //down payment
            const AddVerticalSpace(
              height: ShopDialogConstants.sectionVerticalSpacing,
            ),
            DescriptorRow(
              descriptor: ShopDialogConstants.downPayment,
              value: simpleLoanDialogViewModel.getEconomyAdjustedDownPayment(
                basePrice,
              ),
            ),

            //slider
            DialogSlider(
              value: downPaymentPercentage,
              min: simpleLoanDialogViewModel.getSliderMin(),
              max: simpleLoanDialogViewModel.getSliderMax(),
              onChanged: (value) => simpleLoanDialogViewModel
                  .updateDownPaymentPercentage(value.roundToDouble()),
            ),

            //loan
            const AddVerticalSpace(
              height: ShopDialogConstants.sectionVerticalSpacing,
            ),
            DescriptorRow(
              descriptor: ShopDialogConstants.loan,
              value: simpleLoanDialogViewModel.getEconomyAdjustedLoanAmount(
                billType,
                basePrice,
              ),
            ),

            //installment
            const AddVerticalSpace(
              height: ShopDialogConstants.sectionVerticalSpacing,
            ),
            DescriptorRow(
              descriptor: ShopDialogConstants.installment,
              value:
                  simpleLoanDialogViewModel.getEconomyAdjustedInstallmentAmount(
                billType,
                basePrice,
              ),
            ),

            //apply
            const AddVerticalSpace(
              height: ShopDialogConstants.sectionVerticalSpacing,
            ),
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).pop();
                onApply(downPaymentPercentage.toInt());
              },
              child: const Text(
                ShopDialogConstants.apply,
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }

  Row itemNameRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          ShopDialogConstants.forColonSpace,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const AddHorizontalSpace(
          width: horizontalTextBufferSpacing,
        ),
        Text(
          itemName,
          softWrap: true,
        ),
      ],
    );
  }
}
