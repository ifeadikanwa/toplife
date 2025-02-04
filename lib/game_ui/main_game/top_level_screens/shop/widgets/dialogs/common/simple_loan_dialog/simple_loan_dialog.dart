import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/button/default_elevated_button.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_slider.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/simple_loan_dialog/simple_loan_dialog_view_model.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/model/info_models/economy_adjusted_loan_information.dart';

class SimpleLoanDialog extends ConsumerWidget {
  final String loanApplicationTitle;
  final String itemName;
  final BillType billType;
  final int basePrice;
  final bool useMultipleLoanDownPaymentRange;
  final void Function(
      EconomyAdjustedLoanInformation economyAdjustedLoanInformation) onApply;

  const SimpleLoanDialog({
    super.key,
    required this.loanApplicationTitle,
    required this.itemName,
    required this.billType,
    required this.basePrice,
    this.useMultipleLoanDownPaymentRange = false,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final SimpleLoanDialogViewModelProvider viewModelProvider =
        SimpleLoanDialogViewModelProvider(
      basePrice: basePrice,
      billType: billType,
      useMultipleLoanDownPaymentRange: useMultipleLoanDownPaymentRange,
    );
    //
    final simpleLoanDialogViewModel = ref.watch(viewModelProvider);

    return simpleLoanDialogViewModel.when(
      data: (simpleLoanDialogData) => (simpleLoanDialogData == null)
          ? const SizedBox()
          : DialogContainer(
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
                  value: simpleLoanDialogData.downPaymentString,
                ),

                //slider
                DialogSlider(
                  value: simpleLoanDialogData.chosenDownPaymentPercentage,
                  min: simpleLoanDialogData.sliderMin,
                  max: simpleLoanDialogData.sliderMax,
                  onChanged: (value) => ref
                      .read(viewModelProvider.notifier)
                      .updateDownPaymentPercentage(value.roundToDouble()),
                ),

                //loan
                const AddVerticalSpace(
                  height: ShopDialogConstants.sectionVerticalSpacing,
                ),
                DescriptorRow(
                  descriptor: ShopDialogConstants.loan,
                  value: simpleLoanDialogData.loanString,
                ),

                //installment
                const AddVerticalSpace(
                  height: ShopDialogConstants.sectionVerticalSpacing,
                ),
                DescriptorRow(
                  descriptor: ShopDialogConstants.installment,
                  value: simpleLoanDialogData.installmentString,
                ),

                //apply
                const AddVerticalSpace(
                  height: ShopDialogConstants.sectionVerticalSpacing,
                ),
                DefaultElevatedButton(
                  onPressed: () {
                    AutoRouter.of(context).popForced();
                    onApply(
                      simpleLoanDialogData.economyAdjustedLoanInformation,
                    );
                  },
                  text: ShopDialogConstants.apply,
                ),
              ],
            ),
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
