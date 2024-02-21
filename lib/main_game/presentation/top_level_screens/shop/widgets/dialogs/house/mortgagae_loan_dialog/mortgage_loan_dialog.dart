import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/simple_loan_dialog/simple_loan_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/house/mortgagae_loan_dialog/mortgage_loan_dialog_view_model.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_name.dart';

class MortgageLoanDialog extends ConsumerWidget {
  final House house;
  final int personID;

  const MortgageLoanDialog({
    Key? key,
    required this.house,
    required this.personID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mortgageLoanDialogViewModelDataProvider =
        ref.watch(mortgageLoanDialogViewModelProvider);

    return mortgageLoanDialogViewModelDataProvider.when(
      data: (mortgageLoanDialogViewModel) {
        return SimpleLoanDialog(
          loanApplicationTitle: ShopDialogConstants.mortgageLoanApplication,
          itemName: getHouseName(
            buildingType: house.buildingType,
            houseDesignStyle: house.style,
          ),
          billType: BillType.mortgageLoan,
          basePrice: house.basePrice,
          useMultipleLoanDownPaymentRange:
              mortgageLoanDialogViewModel.getHasExistingMortgage(),
          onApply: (downPaymentPercentage) =>
              mortgageLoanDialogViewModel.applyForMortgageLoan(
            context,
            personID,
            house,
            downPaymentPercentage,
          ),
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }
}
