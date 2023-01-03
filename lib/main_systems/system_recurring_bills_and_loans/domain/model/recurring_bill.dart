import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';

class RecurringBill extends Equatable {
  final int? id;
  final int personID;
  final String billType;
  final String billDescription;
  final int billAmount;
  final int paymentsLeft;
  final int dueDay;
  final int purchaseID;
  final int missedPayments;
  final bool isUrgent;

  const RecurringBill({
    this.id,
    required this.personID,
    required this.billType,
    required this.billDescription,
    required this.billAmount,
    required this.paymentsLeft,
    required this.dueDay,
    required this.purchaseID,
    required this.missedPayments,
    required this.isUrgent,
  });

  @override
  List<Object?> get props => [
        id,
        personID,
        billType,
        billDescription,
        billAmount,
        paymentsLeft,
        dueDay,
        purchaseID,
        missedPayments,
        isUrgent,
      ];

  //helper constants

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

  //-db helpers
  static const String idColumn = "_id";
  static const String personIDColumn = "personID";
  static const String billTypeColumn = "billType";
  static const String billDescriptionColumn = "billDescription";
  static const String billAmountColumn = "billAmount";
  static const String paymentsLeftColumn = "paymentsLeft";
  static const String dueDayColumn = "dueDay";
  static const String purchaseIDColumn = "purchaseID";
  static const String missedPaymentsColumn = "missedPayments";
  static const String isUrgentColumn = "isUrgent";

  static const allColumns = [
    idColumn,
    personIDColumn,
    billTypeColumn,
    billDescriptionColumn,
    billAmountColumn,
    paymentsLeftColumn,
    dueDayColumn,
    purchaseIDColumn,
    missedPaymentsColumn,
    isUrgentColumn,
  ];

  static RecurringBill fromMap({
    required Map<String, Object?> recurringBillMap,
  }) {
    return RecurringBill(
      id: recurringBillMap[idColumn] as int?,
      personID: recurringBillMap[personIDColumn] as int,
      billType: recurringBillMap[billTypeColumn] as String,
      billDescription: recurringBillMap[billDescriptionColumn] as String,
      billAmount: recurringBillMap[billAmountColumn] as int,
      paymentsLeft: recurringBillMap[paymentsLeftColumn] as int,
      dueDay: recurringBillMap[dueDayColumn] as int,
      purchaseID: recurringBillMap[purchaseIDColumn] as int,
      missedPayments: recurringBillMap[missedPaymentsColumn] as int,
      isUrgent: recurringBillMap[isUrgentColumn] == databaseTrueValue,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      personIDColumn: personID,
      billTypeColumn: billType,
      billDescriptionColumn: billDescription,
      billAmountColumn: billAmount,
      paymentsLeftColumn: paymentsLeft,
      dueDayColumn: dueDay,
      purchaseIDColumn: purchaseID,
      missedPaymentsColumn: missedPayments,
      isUrgentColumn: isUrgent ? databaseTrueValue : databaseFalseValue,
    };
  }

  RecurringBill copyWith({
    int? id,
    int? personID,
    String? billType,
    String? billDescription,
    int? billAmount,
    int? paymentsLeft,
    int? dueDay,
    int? purchaseID,
    int? missedPayments,
    bool? isUrgent,
  }) {
    return RecurringBill(
      id: id ?? this.id,
      personID: personID ?? this.personID,
      billType: billType ?? this.billType,
      billDescription: billDescription ?? this.billDescription,
      billAmount: billAmount ?? this.billAmount,
      paymentsLeft: paymentsLeft ?? this.paymentsLeft,
      dueDay: dueDay ?? this.dueDay,
      purchaseID: purchaseID ?? this.purchaseID,
      missedPayments: missedPayments ?? this.missedPayments,
      isUrgent: isUrgent ?? this.isUrgent,
    );
  }
}
