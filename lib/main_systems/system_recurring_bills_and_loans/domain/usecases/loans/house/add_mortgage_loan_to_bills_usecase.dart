import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/day_of_week/day_of_week.dart';
import 'package:toplife/core/utils/day_of_week/get_day_of_the_week.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/info_models/economy_adjusted_loan_information.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/utils/get_address_description.dart';

class AddMortgageLoanToBillsUsecase {
  final RecurringBillRepository _recurringBillRepository;
  final GameUsecases _gameUsecases;

  const AddMortgageLoanToBillsUsecase(
    this._recurringBillRepository,
    this._gameUsecases,
  );

  Future<void> execute({
    required int personID,
    required int houseID,
    required String houseAddress,
    required EconomyAdjustedLoanInformation economyAdjustedLoanInformation,
  }) async {
    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    if (currentGame != null) {
      //get due day of the week
      final DayOfWeek dueDayOfWeek = getDayOfTheWeek(currentGame.currentDay);

      //create a recurring bill
      final RecurringBill mortgageLoanBill = RecurringBill(
        id: DatabaseConstants.dummyId,
        personId: personID,
        billType: BillType.mortgageLoan.name,
        billDescription: getAddressDescription(houseAddress),
        billAmount: economyAdjustedLoanInformation.installment,
        paymentsLeft: economyAdjustedLoanInformation.loan,
        dueDay: dueDayOfWeek.index,
        purchaseId: houseID,
        missedPayments: 0,
        isUrgent: false,
      );

      //save it
      await _recurringBillRepository.createRecurringBill(mortgageLoanBill);
    }
  }
}
