enum BillType {
  rent(
    presentationName: "Rent",
  ),
  mortgageLoan(
    presentationName: "Mortgage Loan",
  ),
  carLoan(
    presentationName: "Car Loan",
  ),
  studentLoans(
    presentationName: "Student Loans",
  ),
  propertyTax(
    presentationName: "Property Tax",
  );

  const BillType({required this.presentationName});

  final String presentationName;
}
