import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/recurring_bill/recurring_bill_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/sub_screens/house/tab_screens/purchase_houses_screen/purchase_houses_screen_view_model.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/model/info_models/economy_adjusted_loan_information.dart';

part 'mortgage_loan_dialog_view_model.g.dart';

class MortgageLoanDialogData extends Equatable {
  final bool hasExistingMortgage;

  const MortgageLoanDialogData({required this.hasExistingMortgage});

  @override
  List<Object?> get props => [hasExistingMortgage];
}

@riverpod
class MortgageLoanDialogViewModel extends _$MortgageLoanDialogViewModel {
  @override
  Future<MortgageLoanDialogData?> build() async {
    final int? currentPlayerId = await ref.watch(
      currentPlayerProvider.selectAsync((data) => data?.id),
    );

    if (currentPlayerId != null) {
      final bool playerHasExistingMortgage = await ref
          .watch(recurringBillsUsecasesProvider)
          .checkIfThereIsAnExistingMortgageLoanUsecase
          .execute(
            personID: currentPlayerId,
          );

      return MortgageLoanDialogData(
        hasExistingMortgage: playerHasExistingMortgage,
      );
    }

    return null;
  }

  void applyForMortgageLoan(
    House house,
    EconomyAdjustedLoanInformation economyAdjustedLoanInformation,
  ) async {
    final int? currentPlayerId = await ref.watch(
      currentPlayerProvider.selectAsync((data) => data?.id),
    );

    if (currentPlayerId != null) {
      final bool purchaseSuccessful = await ref
          .read(shopAndStorageUsecasesProvider)
          .purchaseHouseWithLoanUsecase
          .execute(
            house: house,
            economyAdjustedLoanInformation: economyAdjustedLoanInformation,
            personID: currentPlayerId,
          );

      if (purchaseSuccessful) {
        ref
            .read(purchaseHousesScreenViewModelProvider.notifier)
            .removePurchasedHouseFromShop(house);
      }
    }
  }
}
