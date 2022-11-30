import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';

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
      "student loans presentation name is Student Loans",
      () {
        expect(BillType.studentLoans.presentationName, "Student Loans");
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
