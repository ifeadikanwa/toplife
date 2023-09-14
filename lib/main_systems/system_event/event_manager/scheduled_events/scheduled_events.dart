import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/age/age_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/event/event_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_party/attend_party.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_party/get_first_person_party_partner_attendance_description.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_party/perform_party_activity.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday/birthday_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday_party/birthday_party_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/funeral/funeral_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/test_events/test_events.dart';

class ScheduledEvents {
  //getter for all scheduled events
  //provides them with all needed dependencies

  final Ref _ref;

  const ScheduledEvents({required Ref ref}) : _ref = ref;

  TestEvents get testEvents => TestEvents(
        _ref.read(journalUsecasesProvider),
        _ref.read(eventRepositoryProvider),
        _ref.read(personUsecasesProvider),
      );

  BirthdayEvent get birthdayEvent => BirthdayEvent(
        _ref.read(relationshipUsecasesProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(ageUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(eventSchedulersProvider),
        _ref.read(eventRepositoryProvider),
      );

  BirthdayPartyEvent get birthdayPartyEvent => BirthdayPartyEvent(
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipUsecasesProvider),
        _ref.read(shopAndStorageUsecasesProvider),
        _ref.read(ageUsecasesProvider),
        _performPartyActivity,
        _attendParty,
        _getFirstPersonPartyPartnerAttendanceDescription,
      );

  DeathEvent get deathEvent => DeathEvent(
        _ref.read(eventRepositoryProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipUsecasesProvider),
        _ref.read(eventSchedulersProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(ageUsecasesProvider),
      );

  FuneralEvent get funeralEvent => FuneralEvent(
        _ref.read(eventRepositoryProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipUsecasesProvider),
        _ref.read(journalUsecasesProvider),
      );

  //private helpers
  AttendParty get _attendParty => AttendParty(
        _ref.read(eventRepositoryProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(shopAndStorageUsecasesProvider),
      );

  PerformPartyActivity get _performPartyActivity => PerformPartyActivity(
        _ref.read(personUsecasesProvider),
      );

  GetFirstPersonPartyPartnerAttendanceDescription
      get _getFirstPersonPartyPartnerAttendanceDescription =>
          GetFirstPersonPartyPartnerAttendanceDescription(
            _ref.read(personUsecasesProvider),
            _ref.read(relationshipUsecasesProvider),
          );
}
