import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/event/event_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/main_systems/system_event/event_manager/manage_events/check_if_event_can_still_be_attended.dart';
import 'package:toplife/main_systems/system_event/event_manager/manage_events/check_if_event_is_open.dart';
import 'package:toplife/main_systems/system_event/event_manager/manage_events/get_todays_attendable_events.dart';
import 'package:toplife/main_systems/system_event/event_manager/manage_events/report_unattended_events_to_days_journal.dart';
import 'package:toplife/main_systems/system_event/event_manager/manage_events/run_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/manage_events/run_scheduled_events_for_the_day.dart';
import 'package:toplife/main_systems/system_event/event_manager/manage_events/run_test_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/manage_events/watch_todays_attendable_events.dart';

//The main point of contact for everything event related.
//other systems outside of the event system should only have access to this class.
//-run event
//-schedule new person events -> takes in relationship to you & other needed info
//-run random events
class EventManager {
  final Ref _ref;

  const EventManager({required Ref ref}) : _ref = ref;

  static const int eventAttendanceAllowanceTime = 30;

  //the min amount of time the player has to stay at an event for it to count as an attendance
  static const int eventMinimumAttendanceTime = 30;

  RunScheduledEventsForTheDay get runScheduledEventsForTheDay =>
      RunScheduledEventsForTheDay(
        _ref.read(eventRepositoryProvider),
        runEvent,
      );

  ReportUnattendedEventsToDaysJournal get reportUnattendedEventsToDaysJournal =>
      ReportUnattendedEventsToDaysJournal(
        _ref.read(eventRepositoryProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipUsecasesProvider),
      );

  RunEvent get runEvent => RunEvent(_ref.read(scheduledEventsProvider));

  RunTestEvent get runTestEvent =>
      RunTestEvent(_ref.read(scheduledEventsProvider));

  CheckIfEventIsOpen get checkIfEventIsOpen => CheckIfEventIsOpen();

  CheckIfEventCanStillBeAttended get checkIfEventCanStillBeAttended =>
      CheckIfEventCanStillBeAttended();

  GetTodaysAttendableEvents get getTodaysAttendableEvents =>
      GetTodaysAttendableEvents(
        _ref.read(eventRepositoryProvider),
        _ref.read(personUsecasesProvider),
      );

  WatchTodaysAttendableEvents get watchTodaysAttendableEvents =>
      WatchTodaysAttendableEvents(
        _ref.read(eventRepositoryProvider),
        _ref.read(personUsecasesProvider),
      );
}
