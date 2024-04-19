import 'package:equatable/equatable.dart';

class EventChoice extends Equatable {
  final String choiceDescription;
  final Future<void> Function() choiceAction;

  const EventChoice({
    required this.choiceDescription,
    required this.choiceAction,
  });

  @override
  List<Object?> get props => [
        choiceDescription,
        choiceAction,
      ];
}
