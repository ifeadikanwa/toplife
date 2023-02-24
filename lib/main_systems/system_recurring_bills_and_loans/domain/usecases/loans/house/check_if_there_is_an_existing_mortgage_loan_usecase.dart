import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';

class CheckIfThereIsAnExistingMortgageLoanUsecase {
  final RecurringBillRepository _recurringBillRepository;

  const CheckIfThereIsAnExistingMortgageLoanUsecase(
    this._recurringBillRepository,
  );

  Future<bool> execute({
    required int personID,
  }) async {
    final List<RecurringBill> mortgageLoans =
        await _recurringBillRepository.findRecurringBillsWithType(
      personID: personID,
      billType: BillType.mortgageLoan.name,
    );

    //return true if there are mortgage loans and false if there are none.
    return mortgageLoans.isNotEmpty; 
  }
}
