class RecurringBillConstants {
  static const int recurringPaymentDuration = 7; //every 7 days
  static const int propertyTaxPercentage = 2; //2% of full house price
  //40% of house price is expected to be in the bank for mortgage approval
  static const int multipleLoansExpectedBankReservePercentage = 40;
  //-repayments
  static const int mortgageLoanNumOfPayments = 8;
  static const int carLoanNumOfPayments = 5;
  static const int studentLoanNumOfPayments = 8;
  //-interest
  static const int mortgageLoanInterest = 20;
  static const int carLoanInterest = 15;
  static const int studentLoanInterest = 20;
  //-down payments
  static const int firstLoanDownPaymentPercentageLowerLimit = 5;
  static const int firstLoanDownPaymentPercentageUpperLimit = 15;
  static const int multipleLoansDownPaymentPercentageLowerLimit = 15;
  static const int multipleLoansDownPaymentPercentageUpperLimit = 30;
}
