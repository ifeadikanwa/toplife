import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';

void main() {
  group("BillType:", () {
    test(
      "rent presentation name is Rent",
      () {
        expect(BillType.rent.presentationName, "Rent");
      },
    );

    test(
      "mortgage loan presentation name is Mortgage Loan",
      () {
        expect(BillType.mortgageLoan.presentationName, "Mortgage Loan");
      },
    );

    test(
      "car loan presentation name is Car Loan",
      () {
        expect(BillType.carLoan.presentationName, "Car Loan");
      },
    );

    test(
      "student loan presentation name is Student Loan",
      () {
        expect(BillType.studentLoan.presentationName, "Student Loan");
      },
    );

    test(
      "property tax presentation name is Property Tax",
      () {
        expect(BillType.propertyTax.presentationName, "Property Tax");
      },
    );
  });
}
