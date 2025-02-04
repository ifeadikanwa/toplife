import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/recurring_bill/recurring_bill_dependencies_providers.dart';
import 'package:toplife/core/common_states/get/player_and_game/formatted_money_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/recurring_bill_constants.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/model/info_models/economy_adjusted_loan_information.dart';

part 'simple_loan_dialog_view_model.g.dart';

@CopyWith()
class SimpleLoanDialogData extends Equatable {
  final double chosenDownPaymentPercentage;
  final EconomyAdjustedLoanInformation economyAdjustedLoanInformation;
  final double sliderMin;
  final double sliderMax;
  final String downPaymentString;
  final String installmentString;
  final String loanString;

  const SimpleLoanDialogData({
    required this.chosenDownPaymentPercentage,
    required this.economyAdjustedLoanInformation,
    required this.sliderMin,
    required this.sliderMax,
    required this.downPaymentString,
    required this.installmentString,
    required this.loanString,
  });

  @override
  List<Object?> get props => [
        chosenDownPaymentPercentage,
        economyAdjustedLoanInformation,
        sliderMin,
        sliderMax,
        downPaymentString,
        installmentString,
        loanString,
      ];
}

@riverpod
class SimpleLoanDialogViewModel extends _$SimpleLoanDialogViewModel {
  static const adjustPricesToEconomy = false;

  @override
  Future<SimpleLoanDialogData?> build({
    required int basePrice,
    required BillType billType,
    required bool useMultipleLoanDownPaymentRange,
  }) async {
    final int? currentPlayerId = await ref.watch(
      currentPlayerProvider.selectAsync((data) => data?.id),
    );

    if (currentPlayerId != null) {
      //down payment is set to the min ate the start
      final double startingDownPaymentPercentage = _getSliderMin();

      //get the calculated loan info
      final EconomyAdjustedLoanInformation economyAdjustedLoanInformation =
          await ref
              .watch(recurringBillsUsecasesProvider)
              .getCalculatedLoanInformationUsingBillTypeUsecase
              .execute(
                currentPlayerID: currentPlayerId,
                downPaymentPercentage: startingDownPaymentPercentage.toInt(),
                basePrice: basePrice,
                billType: billType,
              );

      return SimpleLoanDialogData(
        chosenDownPaymentPercentage: startingDownPaymentPercentage,
        sliderMin: _getSliderMin(),
        sliderMax: _getSliderMax(),
        economyAdjustedLoanInformation: economyAdjustedLoanInformation,
        downPaymentString: await ref.watch(formattedMoneyProvider(
          amount: economyAdjustedLoanInformation.downPayment,
          adjustToEconomy: adjustPricesToEconomy,
        ).future),
        installmentString: await ref.watch(formattedMoneyProvider(
          amount: economyAdjustedLoanInformation.installment,
          adjustToEconomy: adjustPricesToEconomy,
        ).future),
        loanString: await ref.watch(formattedMoneyProvider(
          amount: economyAdjustedLoanInformation.loan,
          adjustToEconomy: adjustPricesToEconomy,
        ).future),
      );
    }

    //return null if player id is not valid
    return null;
  }

  Future<void> updateDownPaymentPercentage(
    double newDownPaymentPercentage,
  ) async {
    //get
    final int? currentPlayerId = await ref.watch(
      currentPlayerProvider.selectAsync((data) => data?.id),
    );
    final SimpleLoanDialogData? currentState = state.valueOrNull;

    //if valid
    if (currentPlayerId != null && currentState != null) {
      //get calculated loan info with new down payment percentage
      final EconomyAdjustedLoanInformation economyAdjustedLoanInformation =
          await ref
              .watch(recurringBillsUsecasesProvider)
              .getCalculatedLoanInformationUsingBillTypeUsecase
              .execute(
                currentPlayerID: currentPlayerId,
                downPaymentPercentage: newDownPaymentPercentage.toInt(),
                basePrice: basePrice,
                billType: billType,
              );

      //update state
      state = AsyncData(currentState.copyWith(
        chosenDownPaymentPercentage: newDownPaymentPercentage,
        economyAdjustedLoanInformation: economyAdjustedLoanInformation,
        downPaymentString: await ref.watch(formattedMoneyProvider(
          amount: economyAdjustedLoanInformation.downPayment,
          adjustToEconomy: adjustPricesToEconomy,
        ).future),
        installmentString: await ref.watch(formattedMoneyProvider(
          amount: economyAdjustedLoanInformation.installment,
          adjustToEconomy: adjustPricesToEconomy,
        ).future),
        loanString: await ref.watch(formattedMoneyProvider(
          amount: economyAdjustedLoanInformation.loan,
          adjustToEconomy: adjustPricesToEconomy,
        ).future),
      ));
    }
  }

  double _getSliderMin() {
    if (useMultipleLoanDownPaymentRange) {
      return RecurringBillConstants.multipleLoansDownPaymentPercentageLowerLimit
          .toDouble();
    } else {
      return RecurringBillConstants.firstLoanDownPaymentPercentageLowerLimit
          .toDouble();
    }
  }

  double _getSliderMax() {
    if (useMultipleLoanDownPaymentRange) {
      return RecurringBillConstants.multipleLoansDownPaymentPercentageUpperLimit
          .toDouble();
    } else {
      return RecurringBillConstants.firstLoanDownPaymentPercentageUpperLimit
          .toDouble();
    }
  }
}
