import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_slider.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/money/get_currency_label_from_currency_string.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/recurring_bill_constants.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';

class SimpleLoanDialog extends ConsumerWidget {
  final String loanApplicationTitle;
  final String itemName;
  final BillType billType;
  final int basePrice;
  final bool useMultipleLoanDownPaymentRange;
  final void Function(int downPaymentPercentage) onApply;

  late final AutoDisposeStateProvider<double> _downPaymentPercentageProvider;

  SimpleLoanDialog({
    Key? key,
    required this.loanApplicationTitle,
    required this.itemName,
    required this.billType,
    required this.basePrice,
    this.useMultipleLoanDownPaymentRange = false,
    required this.onApply,
  })  : _downPaymentPercentageProvider = StateProvider.autoDispose<double>(
            (ref) => useMultipleLoanDownPaymentRange
                ? RecurringBillConstants.multipleLoansDownPaymentPercentageLowerLimit
                    .toDouble()
                : RecurringBillConstants.firstLoanDownPaymentPercentageLowerLimit
                    .toDouble()),
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? currentCurrency =
        ref.watch(currentPlayerCurrencyProvider).valueOrNull;
    final String? currentPlayerCountry =
        ref.watch(currentPlayerCountryProvider).valueOrNull;
    final recurringBillsUsecases = ref.watch(recurringBillUsecaseProvider);
    final double downPaymentPercentage =
        ref.watch(_downPaymentPercentageProvider);

    //base calculations
    final baseDownPayment =
        recurringBillsUsecases.baseDownPaymentCalculatorUsecase.execute(
      downPaymentPercentage: downPaymentPercentage.toInt(),
      basePrice: basePrice,
    );
    final baseLoanAmount =
        recurringBillsUsecases.baseLoanAmountCalculatorUsecase.execute(
      baseDownPayment: baseDownPayment,
      basePrice: basePrice,
    );

    //slider values
    late int min;
    late int max;
    if (useMultipleLoanDownPaymentRange) {
      min = RecurringBillConstants.multipleLoansDownPaymentPercentageLowerLimit;
      max = RecurringBillConstants.multipleLoansDownPaymentPercentageUpperLimit;
    } else {
      min = RecurringBillConstants.firstLoanDownPaymentPercentageLowerLimit;
      max = RecurringBillConstants.firstLoanDownPaymentPercentageUpperLimit;
    }

    return (currentPlayerCountry != null)
        ? DialogContainer(
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
                value:
                    "${getCurrencyLabelFromCurrencyString(currentCurrency)}${getCountryEconomyAdjustedPrice(
                  country: currentPlayerCountry,
                  basePrice: baseDownPayment,
                )}",
              ),
              downPaymentSlider(
                ref: ref,
                min: min,
                max: max,
              ),

              //loan
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              DescriptorRow(
                descriptor: ShopDialogConstants.loan,
                value:
                    "${getCurrencyLabelFromCurrencyString(currentCurrency)}${getLoan(
                  recurringBillsUsecases,
                  billType,
                  baseLoanAmount,
                  currentPlayerCountry,
                )}",
              ),

              //installment
              const AddVerticalSpace(
                height: ShopDialogConstants.sectionVerticalSpacing,
              ),
              DescriptorRow(
                  descriptor: ShopDialogConstants.installment,
                  value:
                      "${getCurrencyLabelFromCurrencyString(currentCurrency)}${getInstallment(
                    recurringBillsUsecases,
                    billType,
                    baseLoanAmount,
                    currentPlayerCountry,
                  )}"),

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
          )
        : Container();
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

  DialogSlider downPaymentSlider({
    required WidgetRef ref,
    required int min,
    required int max,
  }) {
    return DialogSlider(
      value: ref.watch(_downPaymentPercentageProvider),
      min: min.toDouble(),
      max: max.toDouble(),
      onChanged: (value) => ref
          .read(_downPaymentPercentageProvider.notifier)
          .state = value.roundToDouble(),
    );
  }

  String getLoan(
    RecurringBillsUsecases recurringBillsUsecases,
    BillType billType,
    int baseLoanAmount,
    String playerCountry,
  ) {
    switch (billType) {
      case BillType.carLoan:
        return recurringBillsUsecases.carLoanCalculatorUsecase
            .execute(
              baseLoanAmount: baseLoanAmount,
              country: playerCountry,
            )
            .toString();
      case BillType.mortgageLoan:
        return recurringBillsUsecases.mortgageLoanCalculatorUsecase
            .execute(
              baseLoanAmount: baseLoanAmount,
              country: playerCountry,
            )
            .toString();
      default:
        return TextConstants.dash;
    }
  }

  String getInstallment(
    RecurringBillsUsecases recurringBillsUsecases,
    BillType billType,
    int baseLoanAmount,
    String playerCountry,
  ) {
    switch (billType) {
      case BillType.carLoan:
        return recurringBillsUsecases.carLoanRecurringPaymentCalculatorUsecase
            .execute(
              baseLoanAmount: baseLoanAmount,
              country: playerCountry,
            )
            .toString();
      case BillType.mortgageLoan:
        return recurringBillsUsecases
            .mortgageLoanRecurringPaymentCalculatorUsecase
            .execute(
              baseLoanAmount: baseLoanAmount,
              country: playerCountry,
            )
            .toString();
      default:
        return TextConstants.dash;
    }
  }
}
