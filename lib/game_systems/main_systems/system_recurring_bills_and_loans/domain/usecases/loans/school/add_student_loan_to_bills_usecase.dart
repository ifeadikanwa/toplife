import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/day_of_week/day_of_week.dart';
import 'package:toplife/core/utils/day_of_week/get_day_of_the_week.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/model/info_models/economy_adjusted_loan_information.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';


class AddStudentLoanToBillsUsecase {
  final RecurringBillRepository _recurringBillRepository;
  final GameUsecases _gameUsecases;

  const AddStudentLoanToBillsUsecase(
    this._recurringBillRepository,
    this._gameUsecases,
  );

  Future<void> execute({
    required int personID,
    required int schoolID,
    required String schoolName,
    required EconomyAdjustedLoanInformation economyAdjustedLoanInformation,
  }) async {
    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    if (currentGame != null) {
      //get due day of the week
      final DayOfWeek dueDayOfWeek = getDayOfTheWeek(currentGame.currentDay);

      //create a recurring bill
      final RecurringBill studentLoanBill = RecurringBill(
        id: DatabaseConstants.dummyId,
        personId: personID,
        billType: BillType.studentLoan.name,
        billDescription: schoolName,
        billAmount: economyAdjustedLoanInformation.installment,
        paymentsLeft: economyAdjustedLoanInformation.loan,
        dueDay: dueDayOfWeek.index,
        purchaseId: schoolID,
        missedPayments: 0,
        isUrgent: false,
      );

      //save it
      await _recurringBillRepository.createRecurringBill(studentLoanBill);
    }
  }
}
