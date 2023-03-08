import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/car/car_loan_dialog/car_loan_dialog_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/simple_loan_dialog/simple_loan_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';

class CarLoanDialog extends ConsumerWidget {
  final Car car;
  final int personID;
  const CarLoanDialog({
    Key? key,
    required this.car,
    required this.personID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carLoanDialogViewModel = ref.watch(carLoanDialogViewModelProvider);

    return SimpleLoanDialog(
      loanApplicationTitle: ShopDialogConstants.carLoanApplication,
      itemName: car.name,
      billType: BillType.carLoan,
      basePrice: car.basePrice,
      onApply: (downPaymentPercentage) =>
          carLoanDialogViewModel.applyForCarLoan(
        context,
        personID,
        car,
        downPaymentPercentage,
      ),
    );
  }
}
