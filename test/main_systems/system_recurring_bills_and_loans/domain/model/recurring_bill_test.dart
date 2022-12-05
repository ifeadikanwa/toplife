import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/recurring_bill.dart';

void main() {
  late RecurringBill sut;

  setUp(() {
    sut = const RecurringBill(
      id: 2,
      personID: 1,
      billType: "billType",
      billDescription: "billDescription",
      billAmount: 1000,
      paymentsLeft: 2000,
      dueDay: 5,
      purchaseID: 3,
      missedPayments: 6,
      isUrgent: true,
    );
  });

  group(
    "RecurringBill:",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "_id": 2,
          "personID": 1,
          "billType": "billType",
          "billDescription": "billDescription",
          "billAmount": 1000,
          "paymentsLeft": 2000,
          "dueDay": 5,
          "purchaseID": 3,
          "missedPayments": 6,
          "isUrgent": 1,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns recurringBill object equivalent of map ", () {
        final Map<String, Object?> map = {
          "_id": 2,
          "personID": 1,
          "billType": "billType",
          "billDescription": "billDescription",
          "billAmount": 1000,
          "paymentsLeft": 2000,
          "dueDay": 5,
          "purchaseID": 3,
          "missedPayments": 6,
          "isUrgent": 1,
        };

        final result = RecurringBill.fromMap(recurringBillMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        const correctRecurringBill = RecurringBill(
          id: 2,
          personID: 1,
          billType: "billType",
          billDescription: "Good University",
          billAmount: 1000,
          paymentsLeft: 2000,
          dueDay: 5,
          purchaseID: 3,
          missedPayments: 2,
          isUrgent: true,
        );

        final result =
            sut.copyWith(missedPayments: 2, billDescription: "Good University");
        expect(result, correctRecurringBill);
      });

      group("Constants", () {
        test("id column should be defined as _id", () {
          expect(RecurringBill.idColumn, "_id");
        });

        test("recurring payment duration is 7 days", () {
          expect(RecurringBill.recurringPaymentDuration, 7);
        });

        test("property tax percentage is 2%", () {
          expect(RecurringBill.propertyTaxPercentage, 2);
        });

        test("car loan number of payments is 5", () {
          expect(RecurringBill.carLoanNumOfPayments, 5);
        });
        test("student loan number of payments is 8", () {
          expect(RecurringBill.studentLoanNumOfPayments, 8);
        });

        test("mortgage loan interest is 20%", () {
          expect(RecurringBill.mortgageLoanInterest, 20);
        });

        test("car loan interest is 15%", () {
          expect(RecurringBill.carLoanInterest, 15);
        });

        test("student loan interest is 20%", () {
          expect(RecurringBill.studentLoanInterest, 20);
        });

        test("first loan down payment percentage lower limit is 5%", () {
          expect(RecurringBill.firstLoanDownPaymentPercentageLowerLimit, 5);
        });

        test("first loan down payment percentage upper limit is 15%", () {
          expect(RecurringBill.firstLoanDownPaymentPercentageUpperLimit, 15);
        });

        test("multiple loans down payment percentage lower limit is 15%", () {
          expect(
              RecurringBill.multipleLoansDownPaymentPercentageLowerLimit, 15);
        });

        test("multiple loans down payment percentage upper limit is 30%", () {
          expect(
              RecurringBill.multipleLoansDownPaymentPercentageUpperLimit, 30);
        });
      });
    },
  );
}
