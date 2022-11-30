import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/regular/add_rent_to_bills_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/regular/remove_rent_from_bills_usecase.dart';

class RecurringBillsUsecases {
  final RecurringBillRepository _recurringBillRepository;
  final GameUsecases _gameUsecases;

  const RecurringBillsUsecases({
    required RecurringBillRepository recurringBillRepository,
    required GameUsecases gameUsecases,
  })  : _recurringBillRepository = recurringBillRepository,
        _gameUsecases = gameUsecases;

  AddRentToBillsUsecase get addRentToBillsUsecase => AddRentToBillsUsecase(
        _recurringBillRepository,
        _gameUsecases,
      );

  RemoveRentFromBillsUsecase get removeRentFromBillsUsecase =>
      RemoveRentFromBillsUsecase(
        _recurringBillRepository,
      );
}
