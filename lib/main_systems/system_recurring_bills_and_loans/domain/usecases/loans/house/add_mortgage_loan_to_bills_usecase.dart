import 'package:toplife/core/utils/day_of_week/day_of_week.dart';
import 'package:toplife/core/utils/day_of_week/get_day_of_the_week.dart';
import 'package:toplife/game_manager/domain/model/game.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/recurring_bill.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/mortgage_loan_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/mortgage_loan_recurring_payment_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/utils/get_address_description.dart';

class AddMortgageLoanToBillsUsecase {
  final RecurringBillRepository _recurringBillRepository;
  final PersonUsecases _personUsecases;
  final GameUsecases _gameUsecases;
  final MortgageLoanCalculatorUsecase _mortgageLoanCalculatorUsecase;
  final MortgageLoanRecurringPaymentCalculatorUsecase
      _mortgageLoanRecurringPaymentCalculatorUsecase;

  const AddMortgageLoanToBillsUsecase(
    this._recurringBillRepository,
    this._personUsecases,
    this._gameUsecases,
    this._mortgageLoanCalculatorUsecase,
    this._mortgageLoanRecurringPaymentCalculatorUsecase,
  );

  Future<void> execute({
    required int personID,
    required int baseLoanAmount,
    required int houseID,
    required String houseAddress,
  }) async {
    final Person? person = await _personUsecases.getPersonUsecase.execute(
      personID: personID,
    );

    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    if (person != null && currentGame != null) {
      //get loan amount and reccuring payment
      final int totalLoanAmount = _mortgageLoanCalculatorUsecase.execute(
        baseLoanAmount: baseLoanAmount,
        country: person.country,
      );
      final int recurringPayment =
          _mortgageLoanRecurringPaymentCalculatorUsecase.execute(
        baseLoanAmount: baseLoanAmount,
        country: person.country,
      );

      //get due day of the week
      final DayOfWeek dueDayOfWeek = getDayOfTheWeek(currentGame.currentDay);

      //create a recurring bill
      final RecurringBill mortgageLoanBill = RecurringBill(
        personID: personID,
        billType: BillType.mortgageLoan.name,
        billDescription: getAddressDescription(houseAddress),
        billAmount: recurringPayment,
        paymentsLeft: totalLoanAmount,
        dueDay: dueDayOfWeek.index,
        purchaseID: houseID,
        missedPayments: 0,
        isUrgent: false,
      );

      //save it
      await _recurringBillRepository.createRecurringBill(mortgageLoanBill);
    }
  }
}
