import 'package:equatable/equatable.dart';

class JobPay extends Equatable {
  final int minLevelOneBasePay;
  final int minLevelTwoBasePay;
  final int minLevelThreeBasePay;

  const JobPay({
    required this.minLevelOneBasePay,
    required this.minLevelTwoBasePay,
    required this.minLevelThreeBasePay,
  });

  @override
  List<Object?> get props => [
        minLevelOneBasePay,
        minLevelTwoBasePay,
        minLevelThreeBasePay,
      ];
}
