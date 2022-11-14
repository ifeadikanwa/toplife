import 'package:equatable/equatable.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

class EventPersonPair extends Equatable {
  final Event event;
  final Person person;

  const EventPersonPair({
    required this.event,
    required this.person,
  });

  @override
  List<Object?> get props => [
        event,
        person,
      ];
}
