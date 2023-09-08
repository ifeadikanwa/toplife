import 'package:equatable/equatable.dart';
import 'package:toplife/core/utils/words/sentence_pair.dart';
import 'package:toplife/main_systems/system_transportation/constants/arrival_status.dart';

class TravelResponse extends Equatable {
  final bool isSuccesful;
  final SentencePair problem;
  final ArrivalStatus arrivalStatus;

  const TravelResponse({
    required this.isSuccesful,
    required this.problem,
    required this.arrivalStatus,
  });

  @override
  List<Object?> get props => [
        isSuccesful,
        problem,
        arrivalStatus,
      ];
}
