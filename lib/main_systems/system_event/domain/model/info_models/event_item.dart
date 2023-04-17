import 'package:equatable/equatable.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_person_pair.dart';

class EventItem extends Equatable {
  final EventPersonPair eventPersonPair;
  final bool eventIsOpen;
  final bool eventCanStillBeAttended;

  const EventItem({
    required this.eventPersonPair,
    required this.eventIsOpen,
    required this.eventCanStillBeAttended,
  });

  @override
  List<Object?> get props => [
        eventPersonPair,
        eventIsOpen,
        eventCanStillBeAttended,
      ];
}
