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
  studentLoan(
    presentationName: "Student Loan",
  ),
  propertyTax(
    presentationName: "Property Tax",
  );

  const BillType({required this.presentationName});

  final String presentationName;
}
