import 'package:equatable/equatable.dart';

class TravelDetail extends Equatable {
  final String destinationCountryString;
  final String destinationStateString;
  final String destinationSettlementString;

  const TravelDetail({
    required this.destinationCountryString,
    required this.destinationStateString,
    required this.destinationSettlementString,
  });

  @override
  List<Object?> get props => [
        destinationCountryString,
        destinationStateString,
        destinationSettlementString,
      ];
}
