import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';

class CheckIfThereIsAnExistingCarLoanUsecase {
  final RecurringBillRepository _recurringBillRepository;

  const CheckIfThereIsAnExistingCarLoanUsecase(
    this._recurringBillRepository,
  );

  Future<bool> execute({
    required int personID,
  }) async {
    final List<RecurringBill> carLoans =
        await _recurringBillRepository.findRecurringBillsWithType(
      personID: personID,
      billType: BillType.carLoan.name,
    );

    //return true if there are car loans and false if there are none.
    return carLoans.isNotEmpty; 
  }
}
