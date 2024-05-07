import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_result.dart';
import 'package:toplife/game_manager/action_runner/info_models/affected_by_stats.dart';
import 'package:toplife/game_manager/action_runner/info_models/game_action.dart';
import 'package:toplife/game_manager/action_runner/info_models/report.dart';
import 'package:toplife/game_manager/domain/usecases/create_or_update_pending_time_update_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/get_current_game_and_player_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/resolve_pending_time_update_for_a_game_usecase.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_transportation/constants/travel_problem_texts.dart';
import 'package:toplife/main_systems/system_transportation/constants/travel_type.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_detail.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_duration.dart';
import 'package:toplife/main_systems/system_transportation/domain/model/travel_detail.dart';
import 'package:toplife/game_manager/action_runner/utils/get_list_of_low_stats.dart';
import 'package:toplife/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/main_systems/system_person/constants/person_stats.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_transportation/domain/model/travel_response.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/transportation_usecases.dart';

class ActionRunner {
  final GetCurrentGameAndPlayerUsecase _getCurrentGameAndPlayerUsecase;
  final PersonUsecases _personUsecases;
  final TransportationUsecases _transportationUsecases;
  final DialogHandler _dialogHandler;
  final JournalUsecases _journalUsecases;
  final CreateOrUpdatePendingTimeUpdateUsecase
      _createOrUpdatePendingTimeUpdateUsecase;
  final ResolvePendingTimeUpdateForAGameUsecase
      _resolveAllPendingTimeUpdatesForAGameUsecase;

  const ActionRunner(
    this._getCurrentGameAndPlayerUsecase,
    this._personUsecases,
    this._transportationUsecases,
    this._dialogHandler,
    this._journalUsecases,
    this._createOrUpdatePendingTimeUpdateUsecase,
    this._resolveAllPendingTimeUpdatesForAGameUsecase,
  );

  Future<void> performNoTravelAction({
    required ActionDetail actionDetail,
  }) {
    return _perform(
      actionDetail: actionDetail,
      travelDetail: null,
      travelType: TravelType.none,
    );
  }

  //has no action duration
  Future<void> performOneWayTravelAction({
    required ActionDetail actionDetail,
    required TravelDetail travelDetail,
  }) {
    return _perform(
      actionDetail: actionDetail.copyWith(
        actionDuration: ActionDuration.none(),
      ),
      travelDetail: travelDetail,
      travelType: TravelType.oneWay,
    );
  }

  Future<void> performTwoWayTravelAction({
    required ActionDetail actionDetail,
    required TravelDetail travelDetail,
  }) {
    return _perform(
      actionDetail: actionDetail,
      travelDetail: travelDetail,
      travelType: TravelType.twoWay,
    );
  }

  //main
  Future<void> _perform({
    required ActionDetail actionDetail,
    required TravelDetail? travelDetail,
    required TravelType travelType,
  }) async {
    //player and game
    final PersonGamePair? currentGameAndPlayer =
        await _getCurrentGameAndPlayerUsecase.execute();

    //if game and player is valid
    if (currentGameAndPlayer != null) {
      //
      final Person currentPlayer = currentGameAndPlayer.person;
      final Game currentGame = currentGameAndPlayer.game;

      //get player stats
      final Stats? playerStats =
          await _personUsecases.getPersonStatsUsecase.execute(currentPlayer.id);

      //if stats are valid
      if (playerStats != null) {
        //IMPORTANT CHECK
        //if game action == player action
        //we care about the player stats
        //exit ActionRunner if the player does not pass the minimum stats check
        if (actionDetail.gameAction is PlayerAction) {
          //if energy is less than or equal to 0, we tell the player and don't do anything
          if (playerStats.energy <= 0) {
            return _dialogHandler.showResultDialog(
              title: "What?? Where?? How??",
              result:
                  "What was I going to do again? The room is currently spinning, I think I need to lay down",
            );
          }
        }

        //MOVE ON
        //At this point we are sure that the action is allowed to run

        //handle travel:
        // we want to make arrival time accessible, so that if there is travel and it is successful we can move the game time using the arrival time as start time
        int? travelArrivalTime;
        if (travelDetail != null) {
          //check if context is valid

          //travel
          final TravelResponse travelResponse =
              await _transportationUsecases.landTravelUsecase.execute(
            currentGameID: currentGame.id,
            travellerPersonID: currentPlayer.id,
            npcPassengersPersonIDs: [],
            eventStartTimeInMinutes:
                actionDetail.actionDuration.startTimeInMinutes,
            travelType: travelType,
            travelDetail: travelDetail,
          );

          //if travel is not successful we assume they didn't get to their destination so we cant run the action
          if (!travelResponse.isSuccessful) {
            //log problem in journal
            await _journalUsecases.addToJournalUsecase.execute(
              gameID: currentGame.id,
              day: currentGame.currentDay,
              mainPlayerID: currentPlayer.id,
              entry: travelResponse.problemJournalEntry,
            );

            //show dialog with problem
            await _dialogHandler.showResultDialog(
              title: TravelProblemTexts.title,
              result: travelResponse.problem.secondPersonSentence,
            );

            //exit action runner
            return;
          }
          //set arrival time
          else {
            //if arrival time is greater than zero, set it
            if (travelResponse.arrivalTimeInMinutes > 0) {
              travelArrivalTime = travelResponse.arrivalTimeInMinutes;
            }
          }
        }

        //Game action:
        //
        //get the action to run
        final Future<ActionResult> Function(
          PersonGamePair currentGameAndPlayer,
          DialogHandler dialogHandler,
        ) gameAction = getActionToRun(
          actionDetail: actionDetail,
          playerStats: playerStats,
        );

        //*handle the game action
        await handleGameAction(
          currentGameAndPlayer: currentGameAndPlayer,
          actionDetail: actionDetail,
          gameAction: gameAction,
          arrivalTimeInMinutes: travelArrivalTime,
        );
      }
    }
  }

  Future<ActionResult> Function(
    PersonGamePair currentGameAndPlayer,
    DialogHandler dialogHandler,
  ) getActionToRun({
    required ActionDetail actionDetail,
    required Stats playerStats,
  }) {
    //
    final GameAction gameAction = actionDetail.gameAction;

    //if the game action == executive action
    if (gameAction is ExecutiveAction) {
      //just return the action
      return gameAction.action;
    }
    //it is Player Action
    else {
      //cast as player action
      gameAction as PlayerAction;

      late final bool isLowPerformanceGameAction;

      final AffectedByStats affectedByStats = gameAction.affectedByStats;

      if (affectedByStats is LowStats) {
        //get current player low stats
        final List<PersonStats> lowPlayerStats = getListOfLowStats(
          stats: playerStats,
        );

        //check if the low player stats list contains any of the affected by stats
        if (affectedByStats.stats
            .any((element) => lowPlayerStats.contains(element))) {
          isLowPerformanceGameAction = true;
        }
        //if the stat check is passed
        else {
          isLowPerformanceGameAction = false;
        }
      }
      //action is not affected by low stats
      else {
        isLowPerformanceGameAction = false;
      }

      return (isLowPerformanceGameAction)
          ? gameAction.lowPerformance
          : gameAction.defaultPerformance;
    }
  }

  Future<void> handleGameAction({
    required PersonGamePair currentGameAndPlayer,
    required ActionDetail actionDetail,
    required Future<ActionResult> Function(
      PersonGamePair currentGameAndPlayer,
      DialogHandler dialogHandler,
    ) gameAction,
    required int? arrivalTimeInMinutes,
  }) async {
    //
    final Person currentPlayer = currentGameAndPlayer.person;
    final Game currentGame = currentGameAndPlayer.game;

    //**run the game action
    final ActionResult actionResult = await gameAction(
      currentGameAndPlayer,
      _dialogHandler,
    );

    //if there is a journal update, process it
    //(if we do it here then we can avoid having to repeat it in every usecase)
    final String? journalEntry = actionResult.journalEntry;
    if (journalEntry != null) {
      await _journalUsecases.addToJournalUsecase.execute(
        gameID: currentGame.id,
        day: currentGame.currentDay,
        mainPlayerID: currentPlayer.id,
        entry: journalEntry,
      );
    }

    //if actions succeeded, move time forward by:
    //duration from ACTION DETAIL + duration from ACTION RESULT
    //we want our game actions to be able to decide that an action takes,
    // x amount of time in addition to the default
    if (actionResult.isSuccessful) {
      //
      //duration from detail
      late final int durationFromActionDetail;

      //special case:
      //if the action duration was set using a start and end time AND we have a valid arrival time
      //we have travelled and so the start time in action duration given might not be the arrival time.
      //if the player arrival was early: travel usecase will remove the extra time before start time,
      // so start time IS start time. NO CHANGE NEEDED.
      //if the player arrival was late: start time IS NOT start time,
      // we now have to start counting action duration from the point of arrival. CHANGE NEEDED
      if (actionDetail.actionDuration.startTimeInMinutes != null &&
          actionDetail.actionDuration.endTimeInMinutes != null &&
          arrivalTimeInMinutes != null &&
          arrivalTimeInMinutes >
              actionDetail.actionDuration.startTimeInMinutes!) {
        //use the arrival time and end time to get the correct duration
        durationFromActionDetail =
            actionDetail.actionDuration.endTimeInMinutes! -
                arrivalTimeInMinutes;
      }
      //just set it to what is in action detail
      else {
        durationFromActionDetail =
            actionDetail.actionDuration.durationInMinutes;
      }

      //
      //get total action duration:

      //duration from result
      final int durationFromActionResult = actionResult.durationInMinutes ?? 0;
      //
      final int totalTimeDuration =
          durationFromActionDetail + durationFromActionResult;

      //we create a pending time update because we don't want to update game before the showing the conclusion dialog
      //if we update before the dialog is shown, the game controller will get the update and run scheduled events,
      // which can cause new dialogs to appear before the player has the chance to see the conclusion dialog for this action
      //Why not update game time after showing the dialog?
      // The game ui awaits the dialog, which means the player has to dismiss it before we do our update,.
      // at this point all of the game action code has run, if the player exits the app the time update will never happen.
      // creating a bug where actions can be performed without their duration being added to the game.
      //By using pending time update we can store all the pending time and then if the player exits the app,
      // we can just always add all time updates every time the app is opened.
      await _createOrUpdatePendingTimeUpdateUsecase.execute(
        gameId: currentGame.id,
        timeInMinutes: totalTimeDuration,
      );
    }

    // if a report is requested
    if (actionResult.reportType is Report) {
      //cast
      final Report report = actionResult.reportType as Report;
      //show
      await report.dialog;
    }

    //move time by resolving pending time update
    //it's okay to do here because pending time update will only be created if action was successful
    //if action wasn't successful we still want to process any pending update (from travel for example)
    await _resolveAllPendingTimeUpdatesForAGameUsecase.execute(
      gameId: currentGame.id,
    );
  }
}
