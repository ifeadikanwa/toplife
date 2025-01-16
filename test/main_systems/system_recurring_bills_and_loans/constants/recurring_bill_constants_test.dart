import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/recurring_bill_constants.dart';

void main() {
  group("Recurring bill constants:", () {
    test("recurring payment duration is 7 days", () {
      expect(RecurringBillConstants.recurringPaymentDuration, 7);
    });

    test("property tax percentage is 2%", () {
      expect(RecurringBillConstants.propertyTaxPercentage, 2);
    });

    test("multiple loans expected reserve percentage is 40% of house price",
        () {
      expect(RecurringBillConstants.multipleLoansExpectedBankReservePercentage,
          40);
    });

    test("car loan number of payments is 5", () {
      expect(RecurringBillConstants.carLoanNumOfPayments, 5);
    });
    test("student loan number of payments is 8", () {
      expect(RecurringBillConstants.studentLoanNumOfPayments, 8);
    });

    test("mortgage loan interest is 20%", () {
      expect(RecurringBillConstants.mortgageLoanInterest, 20);
    });

    test("car loan interest is 15%", () {
      expect(RecurringBillConstants.carLoanInterest, 15);
    });

    test("student loan interest is 20%", () {
      expect(RecurringBillConstants.studentLoanInterest, 20);
    });

    test("first loan down payment percentage lower limit is 5%", () {
      expect(
          RecurringBillConstants.firstLoanDownPaymentPercentageLowerLimit, 5);
    });

    test("first loan down payment percentage upper limit is 15%", () {
      expect(
          RecurringBillConstants.firstLoanDownPaymentPercentageUpperLimit, 15);
    });

    test("multiple loans down payment percentage lower limit is 15%", () {
      expect(
          RecurringBillConstants.multipleLoansDownPaymentPercentageLowerLimit,
          15);
    });

    test("multiple loans down payment percentage upper limit is 30%", () {
      expect(
          RecurringBillConstants.multipleLoansDownPaymentPercentageUpperLimit,
          30);
    });
  });
}
