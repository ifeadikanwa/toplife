import 'package:equatable/equatable.dart';

class EconomyAdjustedLoanInformation extends Equatable {
  final int downPayment;
  final int loan;
  final int installment;

  const EconomyAdjustedLoanInformation({
    required this.downPayment,
    required this.loan,
    required this.installment,
  });

  @override
  List<Object?> get props => [
        downPayment,
        loan,
        installment,
      ];

  //blank
  static EconomyAdjustedLoanInformation get blankLoanInformation =>
      const EconomyAdjustedLoanInformation(
        downPayment: 0,
        loan: 0,
        installment: 0,
      );
}
