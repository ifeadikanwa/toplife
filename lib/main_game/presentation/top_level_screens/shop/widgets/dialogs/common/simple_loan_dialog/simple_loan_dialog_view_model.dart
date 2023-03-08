import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/recurring_bill/recurring_bill_dependencies_providers.dart';
import 'package:toplife/core/common_states/get/player_and_game/current_player_bar_info_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/recurring_bill_constants.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';

final simpleLoanDialogViewModelProvider = StateNotifierProvider.family
    .autoDispose<SimpleLoanDialogViewModel, AsyncValue<double>, bool>(
        (ref, useMultipleLoanDownPaymentRange) {
  //get recent
  final currentCurrencyFuture = ref.watch(
    currentPlayerBarInfoProvider
        .selectAsync((playerBarInfo) => playerBarInfo.currency),
  );
  final currentCountryFuture = ref.watch(
    currentPlayerBarInfoProvider
        .selectAsync((playerBarInfo) => playerBarInfo.country),
  );

  return SimpleLoanDialogViewModel(
    recurringBillsUsecases: ref.watch(recurringBillUsecasesProvider),
    useMultipleLoanDownPaymentRange: useMultipleLoanDownPaymentRange,
    currentCurrencyFuture: currentCurrencyFuture,
    currentCountryFuture: currentCountryFuture,
  );
});

class SimpleLoanDialogViewModel extends StateNotifier<AsyncValue<double>> {
  final bool _useMultipleLoanDownPaymentRange;
  final RecurringBillsUsecases _recurringBillsUsecases;
  late final String _currentCurrency;
  late final String _currentCountry;

  //state = downPaymentPercentage
  SimpleLoanDialogViewModel({
    required RecurringBillsUsecases recurringBillsUsecases,
    required bool useMultipleLoanDownPaymentRange,
    required Future<String> currentCurrencyFuture,
    required Future<String> currentCountryFuture,
  })  : _useMultipleLoanDownPaymentRange = useMultipleLoanDownPaymentRange,
        _recurringBillsUsecases = recurringBillsUsecases,
        super(const AsyncLoading()) {
    _setup(
      currentCurrencyFuture: currentCurrencyFuture,
      currentCountryFuture: currentCountryFuture,
    );
  }

  Future<void> _setup({
    required Future<String> currentCurrencyFuture,
    required Future<String> currentCountryFuture,
  }) async {
    _currentCountry = await currentCountryFuture;
    _currentCurrency = await currentCurrencyFuture;

    //the down payment percentage is set to the minimum value
    state = await AsyncValue.guard(() async => getSliderMin());
  }

  void updateDownPaymentPercentage(double newDownPaymentPercentage) async {
    state = await AsyncValue.guard(() async => newDownPaymentPercentage);
  }

  String getEconomyAdjustedDownPayment(int basePrice) {
    final int adjustedDownPayment = getCountryEconomyAdjustedPrice(
      country: _currentCountry,
      basePrice: _getBaseDownPayment(basePrice),
    );
    return "$_currentCurrency$adjustedDownPayment";
  }

  String getEconomyAdjustedLoanAmount(BillType billType, int basePrice) {
    final baseLoanAmount = _getBaseLoanAmount(basePrice);

    String adjustedLoanAmount = "";

    switch (billType) {
      case BillType.carLoan:
        adjustedLoanAmount = _recurringBillsUsecases.carLoanCalculatorUsecase
            .execute(
              baseLoanAmount: baseLoanAmount,
              country: _currentCountry,
            )
            .toString();
        break;
      case BillType.mortgageLoan:
        adjustedLoanAmount =
            _recurringBillsUsecases.mortgageLoanCalculatorUsecase
                .execute(
                  baseLoanAmount: baseLoanAmount,
                  country: _currentCountry,
                )
                .toString();
        break;
      default:
        adjustedLoanAmount = TextConstants.dash;
    }

    return "$_currentCurrency$adjustedLoanAmount";
  }

  String getEconomyAdjustedInstallmentAmount(BillType billType, int basePrice) {
    final baseLoanAmount = _getBaseLoanAmount(basePrice);

    String adjustedInstallmentAmount = "";

    switch (billType) {
      case BillType.carLoan:
        adjustedInstallmentAmount =
            _recurringBillsUsecases.carLoanRecurringPaymentCalculatorUsecase
                .execute(
                  baseLoanAmount: baseLoanAmount,
                  country: _currentCountry,
                )
                .toString();
        break;
      case BillType.mortgageLoan:
        adjustedInstallmentAmount = _recurringBillsUsecases
            .mortgageLoanRecurringPaymentCalculatorUsecase
            .execute(
              baseLoanAmount: baseLoanAmount,
              country: _currentCountry,
            )
            .toString();
        break;
      default:
        adjustedInstallmentAmount = TextConstants.dash;
    }

    return "$_currentCurrency$adjustedInstallmentAmount";
  }

  double getSliderMin() {
    if (_useMultipleLoanDownPaymentRange) {
      return RecurringBillConstants.multipleLoansDownPaymentPercentageLowerLimit
          .toDouble();
    } else {
      return RecurringBillConstants.firstLoanDownPaymentPercentageLowerLimit
          .toDouble();
    }
  }

  double getSliderMax() {
    if (_useMultipleLoanDownPaymentRange) {
      return RecurringBillConstants.multipleLoansDownPaymentPercentageUpperLimit
          .toDouble();
    } else {
      return RecurringBillConstants.firstLoanDownPaymentPercentageUpperLimit
          .toDouble();
    }
  }

  int _getBaseDownPayment(int basePrice) {
    return (state.valueOrNull != null)
        ? _recurringBillsUsecases.baseDownPaymentCalculatorUsecase.execute(
            downPaymentPercentage: state.valueOrNull!.toInt(),
            basePrice: basePrice,
          )
        : 0;
  }

  int _getBaseLoanAmount(int basePrice) {
    return _recurringBillsUsecases.baseLoanAmountCalculatorUsecase.execute(
      baseDownPayment: _getBaseDownPayment(basePrice),
      basePrice: basePrice,
    );
  }
}
