import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/age/age_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/dialog_handler/dialog_handler_provider.dart';
import 'package:toplife/core/common_states/dependencies/event/event_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_event/attend_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_event/get_first_person_event_partner_attendance_description.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_event/perform_party_activity.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday/birthday_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/test_events/test_events.dart';

class ScheduledEvents {
  //getter for all scheduled events
  //provides them with all needed dependencies

  final Ref _ref;

  const ScheduledEvents({required Ref ref}) : _ref = ref;

  TestEvents get testEvents => TestEvents(
        _ref.read(journalUsecasesProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(dialogHandlerProvider),
      );

  BirthdayEvent get birthdayEvent => BirthdayEvent(
        _ref.read(relationshipUsecasesProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(ageUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(eventSchedulersProvider),
        _ref.read(eventRepositoryProvider),
      );

  DeathEvent get deathEvent => DeathEvent(
        _ref.read(eventRepositoryProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipUsecasesProvider),
        _ref.read(eventSchedulersProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(ageUsecasesProvider),
        _ref.read(dialogHandlerProvider),
      );

  AttendEvent get attendEvent => AttendEvent(
        _ref.read(eventRepositoryProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(ageUsecasesProvider),
        _ref.read(shopAndStorageUsecasesProvider),
        _performPartyActivity,
        _getFirstPersonEventPartnerAttendanceDescription,
        _ref.read(dialogHandlerProvider),
      );

  PerformPartyActivity get _performPartyActivity => PerformPartyActivity(
        _ref.read(personUsecasesProvider),
      );

  GetFirstPersonEventPartnerAttendanceDescription
      get _getFirstPersonEventPartnerAttendanceDescription =>
          GetFirstPersonEventPartnerAttendanceDescription(
            _ref.read(personUsecasesProvider),
            _ref.read(relationshipUsecasesProvider),
          );
}
