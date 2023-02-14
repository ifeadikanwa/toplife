import 'package:toplife/core/utils/day_of_week/day_of_week.dart';
import 'package:toplife/core/utils/day_of_week/get_day_of_the_week.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/recurring_bill.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/utils/get_address_description.dart';

class AddRentToBillsUsecase {
  final RecurringBillRepository _recurringBillRepository;
  final GameUsecases _gameUsecases;

  const AddRentToBillsUsecase(
    this._recurringBillRepository,
    this._gameUsecases,
  );

  Future<void> execute({
    required int personID,
    required int billAmount,
    required int houseID,
    required String address,
  }) async {
    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    if (currentGame != null) {
      final DayOfWeek dueDayOfWeek = getDayOfTheWeek(currentGame.currentDay);

      //create recurring bills object
      final RecurringBill rent = RecurringBill(
        personID: personID,
        billType: BillType.rent.name,
        billDescription: getAddressDescription(address),
        billAmount: billAmount,
        paymentsLeft: 0,
        dueDay: dueDayOfWeek.index,
        purchaseID: houseID,
        missedPayments: 0,
        isUrgent: false,
      );

      //save it
      _recurringBillRepository.createRecurringBill(rent);
    }
  }
}
