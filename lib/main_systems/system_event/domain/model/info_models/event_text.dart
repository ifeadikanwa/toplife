import 'package:equatable/equatable.dart';
import 'package:toplife/core/text_constants.dart';

class EventText extends Equatable {
  final String eventTitle;
  final String eventDescription;
  final String journalEntry;
  final String resultTitle;
  final String resultDescription;

  const EventText({
    required this.eventTitle,
    required this.eventDescription,
    required this.journalEntry,
    required this.resultTitle,
    required this.resultDescription,
  });

  static const blankEventText = EventText(
    eventTitle: TextConstants.dash,
    eventDescription: TextConstants.dash,
    journalEntry: TextConstants.dash,
    resultTitle: TextConstants.dash,
    resultDescription: TextConstants.dash,
  );

  @override
  List<Object?> get props => [
        eventTitle,
        eventDescription,
        journalEntry,
        resultTitle,
        resultDescription,
      ];
}
