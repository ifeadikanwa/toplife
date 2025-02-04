import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/car/car_loan_dialog/car_loan_dialog_view_model.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/simple_loan_dialog/simple_loan_dialog.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';

class CarLoanDialog extends ConsumerWidget {
  final Car car;

  const CarLoanDialog({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleLoanDialog(
      loanApplicationTitle: ShopDialogConstants.carLoanApplication,
      itemName: car.name,
      billType: BillType.carLoan,
      basePrice: car.basePrice,
      onApply: (economyAdjustedLoanInformation) =>
          ref.read(carLoanDialogViewModelProvider.notifier).applyForCarLoan(
                car,
                economyAdjustedLoanInformation,
              ),
    );
  }
}
