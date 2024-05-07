import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/age/age_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/dialog_handler/dialog_handler_provider.dart';
import 'package:toplife/core/common_states/dependencies/event/event_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/transportation/transportation_dependencies_providers.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attendable_events/attend_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attendable_events/util/get_attendable_event_information.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attendable_events/util/get_first_person_event_partner_attendance_description.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attendable_events/util/perform_party_activity.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday/birthday_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday/npc_birthday.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday/player_birthday.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/family_planned_funeral.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/npc_planned_funeral.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/player_planned_funeral.dart';
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
        _ref.read(personUsecasesProvider),
        _ref.read(ageUsecasesProvider),
        _ref.read(eventSchedulersProvider),
        _ref.read(eventRepositoryProvider),
        _ref.read(gameUsecasesProvider).actionRunner,
        _playerBirthday,
        _npcBirthday,
      );

  NpcBirthday get _npcBirthday => NpcBirthday(
        _ref.read(relationshipUsecasesProvider),
        _ref.read(eventSchedulersProvider),
      );

  PlayerBirthday get _playerBirthday => PlayerBirthday(
        _ref.read(relationshipUsecasesProvider),
      );

  DeathEvent get deathEvent => DeathEvent(
        _ref.read(eventRepositoryProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipUsecasesProvider),
        _ref.read(ageUsecasesProvider),
        _ref.read(gameUsecasesProvider).actionRunner,
        _playerPlannedFuneral,
        _familyPlannedFuneral,
        _npcPlannedFuneral,
      );

  PlayerPlannedFuneral get _playerPlannedFuneral => PlayerPlannedFuneral(
        _ref.read(personUsecasesProvider),
        _ref.read(eventSchedulersProvider),
      );

  FamilyPlannedFuneral get _familyPlannedFuneral => FamilyPlannedFuneral(
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipUsecasesProvider),
        _ref.read(eventSchedulersProvider),
        _ref.read(ageUsecasesProvider),
      );

  NpcPlannedFuneral get _npcPlannedFuneral => NpcPlannedFuneral(
        _ref.read(eventSchedulersProvider),
      );

  AttendEvent get attendEvent => AttendEvent(
        _ref.read(eventRepositoryProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipUsecasesProvider),
        _ref.read(shopAndStorageUsecasesProvider),
        _performPartyActivity,
        _getFirstPersonEventPartnerAttendanceDescription,
        _ref.read(gameUsecasesProvider).actionRunner,
        _ref.read(transportationUsecasesProvider),
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

  GetAttendableEventInformation get getAttendableEventInformation =>
      GetAttendableEventInformation(
        _ref.read(relationshipUsecasesProvider),
        _ref.read(ageUsecasesProvider),
        _ref.read(shopAndStorageUsecasesProvider),
        _ref.read(personUsecasesProvider),
      );
}
