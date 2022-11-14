import 'package:equatable/equatable.dart';

class TravelResponse extends Equatable {
  final bool isSuccesful;
  final String problem;

  const TravelResponse({
    required this.isSuccesful,
    required this.problem,
  });

  @override
  List<Object?> get props => [
        isSuccesful,
        problem,
      ];
}
