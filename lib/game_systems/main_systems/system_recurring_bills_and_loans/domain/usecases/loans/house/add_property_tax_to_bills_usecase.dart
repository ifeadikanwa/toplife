import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/day_of_week/day_of_week.dart';
import 'package:toplife/core/utils/day_of_week/get_day_of_the_week.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/recurring_bill_constants.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/utils/get_address_description.dart';

class AddPropertyTaxToBillsUsecase {
  final RecurringBillRepository _recurringBillRepository;
  final GameUsecases _gameUsecases;

  const AddPropertyTaxToBillsUsecase(
    this._recurringBillRepository,
    this._gameUsecases,
  );

  Future<void> execute({
    required int personID,
    required int economyAdjustedHousePrice,
    required int houseID,
    required String address,
  }) async {
    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    if (currentGame != null) {
      final DayOfWeek dueDayOfWeek = getDayOfTheWeek(currentGame.currentDay);

      final int propertyTaxBillAmount =
          ((RecurringBillConstants.propertyTaxPercentage / 100) *
                  economyAdjustedHousePrice)
              .ceil();

      //create recurring bills object
      final RecurringBill propertyTax = RecurringBill(
        id: DatabaseConstants.dummyId,
        personId: personID,
        billType: BillType.propertyTax.name,
        billDescription: getAddressDescription(address),
        billAmount: propertyTaxBillAmount,
        paymentsLeft: 0,
        dueDay: dueDayOfWeek.index,
        purchaseId: houseID,
        missedPayments: 0,
        isUrgent: false,
      );

      //save it
      await _recurringBillRepository.createRecurringBill(propertyTax);
    }
  }
}
