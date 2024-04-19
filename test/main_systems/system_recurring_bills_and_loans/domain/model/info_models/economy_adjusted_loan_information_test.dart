import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/info_models/economy_adjusted_loan_information.dart';

void main() {
  group("EconomyAdjustedLoanInformation:", () {
    test(
      "blank loan information is correct",
      () {
        expect(
          EconomyAdjustedLoanInformation.blankLoanInformation,
          const EconomyAdjustedLoanInformation(
            downPayment: 0,
            loan: 0,
            installment: 0,
          ),
        );
      },
    );
  });
}
