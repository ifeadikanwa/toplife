import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/day_of_week/day_of_week.dart';
import 'package:toplife/core/utils/day_of_week/get_day_of_the_week.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/car_loan_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/car_loan_recurring_payment_calculator_usecase.dart';

class AddCarLoanToBillsUsecase {
  final RecurringBillRepository _recurringBillRepository;
  final PersonUsecases _personUsecases;
  final GameUsecases _gameUsecases;
  final CarLoanCalculatorUsecase _carLoanCalculatorUsecase;
  final CarLoanRecurringPaymentCalculatorUsecase
      _carLoanRecurringPaymentCalculatorUsecase;

  const AddCarLoanToBillsUsecase(
    this._recurringBillRepository,
    this._personUsecases,
    this._gameUsecases,
    this._carLoanCalculatorUsecase,
    this._carLoanRecurringPaymentCalculatorUsecase,
  );

  Future<void> execute({
    required int personID,
    required int baseLoanAmount,
    required int carID,
    required String carName,
  }) async {
    final Person? person = await _personUsecases.getPersonUsecase.execute(
      personID: personID,
    );

    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    if (person != null && currentGame != null) {
      //get loan amount and reccuring payment
      final int totalLoanAmount = _carLoanCalculatorUsecase.execute(
        baseLoanAmount: baseLoanAmount,
        country: person.currentCountry,
      );
      final int recurringPayment =
          _carLoanRecurringPaymentCalculatorUsecase.execute(
        baseLoanAmount: baseLoanAmount,
        country: person.currentCountry,
      );

      //get due day of the week
      final DayOfWeek dueDayOfWeek = getDayOfTheWeek(currentGame.currentDay);

      //create a recurring bill
      final RecurringBill carLoanBill = RecurringBill(
        id: DatabaseConstants.dummyId,
        personId: personID,
        billType: BillType.carLoan.name,
        billDescription: carName,
        billAmount: recurringPayment,
        paymentsLeft: totalLoanAmount,
        dueDay: dueDayOfWeek.index,
        purchaseId: carID,
        missedPayments: 0,
        isUrgent: false,
      );

      //save it
      await _recurringBillRepository.createRecurringBill(carLoanBill);
    }
  }
}
