import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/simple_loan_dialog/simple_loan_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/house/mortgage_loan_dialog/mortgage_loan_dialog_view_model.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_name.dart';

class MortgageLoanDialog extends ConsumerWidget {
  final House house;

  const MortgageLoanDialog({
    super.key,
    required this.house,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mortgageLoanDialogViewModel =
        ref.watch(mortgageLoanDialogViewModelProvider);

    return mortgageLoanDialogViewModel.when(
      data: (mortgageLoanDialogData) => (mortgageLoanDialogData == null)
          ? const SizedBox()
          : SimpleLoanDialog(
              loanApplicationTitle: ShopDialogConstants.mortgageLoanApplication,
              itemName: getHouseName(
                buildingType: house.buildingType,
                houseDesignStyle: house.style,
              ),
              billType: BillType.mortgageLoan,
              basePrice: house.basePrice,
              useMultipleLoanDownPaymentRange:
                  mortgageLoanDialogData.hasExistingMortgage,
              onApply: (economyAdjustedLoanInformation) => ref
                  .read(mortgageLoanDialogViewModelProvider.notifier)
                  .applyForMortgageLoan(
                    house,
                    economyAdjustedLoanInformation,
                  ),
            ),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
