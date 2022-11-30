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
      });
    },
  );
}
