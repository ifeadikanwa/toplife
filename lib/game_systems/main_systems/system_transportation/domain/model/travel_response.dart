import 'package:equatable/equatable.dart';
import 'package:toplife/core/utils/words/sentence_pair.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/arrival_status.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/travel_problem_texts.dart';

class TravelResponse extends Equatable {
  final bool isSuccessful;
  final SentencePair problem;
  final ArrivalStatus arrivalStatus;
  final int arrivalTimeInMinutes;

  String get problemJournalEntry =>
      "${TravelProblemTexts.iTriedToTravelByRoadBut}${problem.firstPersonSentence}";

  const TravelResponse({
    required this.isSuccessful,
    required this.problem,
    required this.arrivalStatus,
    required this.arrivalTimeInMinutes,
  });

  @override
  List<Object?> get props => [
        isSuccessful,
        problem,
        problemJournalEntry,
        arrivalStatus,
        arrivalTimeInMinutes
      ];
}
