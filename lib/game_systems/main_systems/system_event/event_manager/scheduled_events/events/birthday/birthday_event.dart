import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/game_systems/game_manager/action_runner/action_runner.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/action_detail.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/action_duration.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/action_result.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/game_action.dart';
import 'package:toplife/game_systems/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/game_systems/main_systems/system_age/age.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/event_scheduler/event_schedulers.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/events/birthday/npc_birthday.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/events/birthday/player_birthday.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';

class BirthdayEvent {
  final PersonUsecases _personUsecases;
  final AgeUsecases _ageUsecases;
  final EventSchedulers _eventScheduler;
  final EventRepository _eventRepository;
  final ActionRunner _actionRunner;
  final PlayerBirthday _playerBirthday;
  final NpcBirthday _npcBirthday;

  const BirthdayEvent(
    this._personUsecases,
    this._ageUsecases,
    this._eventScheduler,
    this._eventRepository,
    this._actionRunner,
    this._playerBirthday,
    this._npcBirthday,
  );

  Future<void> perform({required Event event}) async {
    //event main person
    final Person? eventMainPerson =
        await _personUsecases.getPersonUsecase.execute(
      personID: event.mainPersonId,
    );

    if (eventMainPerson != null) {
      //Action detail
      final ActionDetail actionDetail = ActionDetail(
        actionDuration: ActionDuration.none(),
        gameAction: ExecutiveAction(
          action: (currentGameAndPlayer, dialogHandler) => _execute(
            event: event,
            eventMainPerson: eventMainPerson,
            currentPlayerAndGame: currentGameAndPlayer,
            dialogHandler: dialogHandler,
          ),
        ),
      );

      return _actionRunner.performNoTravelAction(
        actionDetail: actionDetail,
      );
    }
  }

  //the birthday event is NOT a journal only event
  //because It runs age up actions and that could potentially trigger dialogs
  //It is meant to notify the player about peoples birthdays including theirs
  Future<ActionResult> _execute({
    required Event event,
    required Person eventMainPerson,
    required PersonGamePair currentPlayerAndGame,
    required DialogHandler dialogHandler,
  }) async {
    final Person currentPlayer = currentPlayerAndGame.person;

    //get journal entry
    final String journalEntry = await getJournalEntry(
      currentPlayer.id,
      eventMainPerson,
      event,
    );

    //schedule next birthday
    await _eventScheduler.scheduleNextBirthday.execute(
      gameID: event.gameId,
      mainPersonID: event.mainPersonId,
      dayOfBirth: eventMainPerson.dayOfBirth,
      currentDay: event.eventDay,
    );

    //run the age up actions
    await _ageUsecases.ageUpCharacterActionsUsecase.execute(
      characterID: event.mainPersonId,
      currentPlayerID: currentPlayer.id,
      currentDay: event.eventDay,
    );

    //mark event as performed
    await _eventRepository.updateEvent(
      event.copyWith(performed: true),
    );

    //return success result
    return ActionResult.successWithJournalEntryButNoReportOrDuration(
      journalEntry: journalEntry,
    );
  }

  Future<String> getJournalEntry(
    int mainPlayerID,
    Person birthdayPerson,
    Event event,
  ) async {
    //get birthday person age
    final Age age = _ageUsecases.getPersonsAgeUsecase.execute(
      dayOfBirth: birthdayPerson.dayOfBirth,
      currentDay: event.eventDay,
    );

    //if it is player
    if (event.mainPersonId == mainPlayerID) {
      return _playerBirthday.run(
        event,
        birthdayPerson,
        age,
      );
    }
    //else it's an npc
    else {
      return _npcBirthday.run(
        mainPlayerID,
        event,
        birthdayPerson,
        age,
      );
    }
  }
}
