import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_party/attend_party.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_party/get_first_person_party_partner_attendance_description.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_party/perform_party_activity.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday/birthday_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday_party/birthday_party_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/funeral/funeral_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/test_events/test_events.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

class ScheduledEvents {
  //getter for all scheduled events
  //provides them with all needed dependencies

  final RelationshipUsecases _relationshipUsecases;
  final PersonUsecases _personUsecases;
  final AgeUsecases _ageUsecases;
  final JournalUsecases _journalUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final EventScheduler _eventScheduler;
  final EventRepository _eventRepository;

  const ScheduledEvents(
    this._relationshipUsecases,
    this._personUsecases,
    this._ageUsecases,
    this._journalUsecases,
    this._shopAndStorageUsecases,
    this._eventScheduler,
    this._eventRepository,
  );

  TestEvents get testEvents => TestEvents(
        _journalUsecases,
        _eventRepository,
        _personUsecases,
      );

  BirthdayEvent get birthdayEvent => BirthdayEvent(
        _relationshipUsecases,
        _personUsecases,
        _ageUsecases,
        _journalUsecases,
        _eventScheduler,
        _eventRepository,
      );

  BirthdayPartyEvent get birthdayPartyEvent => BirthdayPartyEvent(
        _personUsecases,
        _relationshipUsecases,
        _shopAndStorageUsecases,
        _ageUsecases,
        _performPartyActivity,
        _attendParty,
        _getFirstPersonPartyPartnerAttendanceDescription,
      );

  DeathEvent get deathEvent => DeathEvent(
        _eventRepository,
        _personUsecases,
        _relationshipUsecases,
        _eventScheduler,
        _journalUsecases,
        _ageUsecases,
      );

  FuneralEvent get funeralEvent => FuneralEvent(
        _eventRepository,
        _personUsecases,
        _relationshipUsecases,
        _journalUsecases,
      );

  //private helpers
  AttendParty get _attendParty => AttendParty(
        _eventRepository,
        _personUsecases,
        _relationshipUsecases,
        _journalUsecases,
        _shopAndStorageUsecases,
      );

  PerformPartyActivity get _performPartyActivity => PerformPartyActivity(
        _personUsecases,
      );

  GetFirstPersonPartyPartnerAttendanceDescription
      get _getFirstPersonPartyPartnerAttendanceDescription =>
          GetFirstPersonPartyPartnerAttendanceDescription(
            _personUsecases,
            _relationshipUsecases,
          );
}
