import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/simple_loan_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_name.dart';

final _hasExistingMortgageProvider =
    FutureProvider.autoDispose<bool?>((ref) async {
  final Game? currentGame = ref.watch(currentGameProvider).valueOrNull;
  return (currentGame != null)
      ? await ref
          .watch(recurringBillUsecaseProvider)
          .checkIfThereIsAnExistingMortgageLoanUsecase
          .execute(
            personID: currentGame.currentPlayerID,
          )
      : null;
});

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
    final ShopAndStorageUsecases shopAndStorageUsecases =
        ref.watch(shopAndStorageUsecaseProvider);

    final hasExistingMortgage =
        ref.watch(_hasExistingMortgageProvider).valueOrNull;

    return (hasExistingMortgage != null)
        ? SimpleLoanDialog(
            loanApplicationTitle: ShopDialogConstants.mortgageLoanApplication,
            itemName: getHouseName(
              buildingType: house.buildingType,
              houseDesignStyle: house.style,
            ),
            billType: BillType.mortgageLoan,
            basePrice: house.basePrice,
            useMultipleLoanDownPaymentRange: hasExistingMortgage,
            onApply: (downPaymentPercentage) =>
                shopAndStorageUsecases.purchaseHouseWithLoanUsecase.execute(
              context: context,
              house: house,
              downPaymentPercentage: downPaymentPercentage,
              personID: personID,
            ),
          )
        : Container();
  }
}
