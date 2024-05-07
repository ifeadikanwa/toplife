import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/date_and_time/day_and_minutes.dart';
import 'package:toplife/core/utils/date_and_time/get_minutes_between_two_times.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';
import 'package:toplife/game_systems/game_manager/domain/usecases/control_game/decay_and_alter_player_stats_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/event_manager.dart';

class GameControllerUsecase {
  final DecayAndAlterPlayerStatsUsecase _decayAndAlterPlayerStatsUsecase;
  final EventManager _eventManager;

  const GameControllerUsecase(
    this._decayAndAlterPlayerStatsUsecase,
    this._eventManager,
  );

  Future<void> execute({
    required Future<Game?>? previousGameFuture,
    required Future<Game?> nextGameFuture,
  }) async {
    //Check if game controller actually needs to do work:

    if (previousGameFuture != null) {
      //get the data
      final Game? oldGame = await previousGameFuture;
      final Game? newGame = await nextGameFuture;

      //check if both are valid
      if (oldGame != null && newGame != null) {
        //check if the time has changed
        if (oldGame.currentDay != newGame.currentDay ||
            oldGame.currentTimeInMinutes != newGame.currentTimeInMinutes) {
          //if time has changed, DO WORK!

          //GAME CONTROLLER WORK

          //get hours passed
          final int totalMinutesPassed = getMinutesBetweenTwoTimes(
              startTime: DayAndMinutes(
                day: oldGame.currentDay,
                minutes: oldGame.currentTimeInMinutes,
                isNewDay: false,
              ),
              endTime: DayAndMinutes(
                day: newGame.currentDay,
                minutes: newGame.currentTimeInMinutes,
                isNewDay: false,
              ));
          //get the absolute value to be completely error proof
          final double hoursPassed =
              (totalMinutesPassed / Time.minutesInAnHour).abs();

          //As long as there is a valid current player id attached to game:
          final int? newGameCurrentPlayerId = newGame.currentPlayerID;

          if (newGameCurrentPlayerId != null) {
            //Alter player stats:
            await _decayAndAlterPlayerStatsUsecase.execute(
              playerID: newGameCurrentPlayerId,
              hoursPassed: hoursPassed,
            );

            //Handle Events:

            //PAST
            //First we handle days that have passed
            //if it is still the same game and
            //if the current game's day is different from the previous game's day.
            //we want to handle events for all the days passed
            //run scheduled events and report unattended events:
            if ((newGame.id == oldGame.id) &&
                (newGame.currentDay != oldGame.currentDay)) {
              //start from the previous game's day until but not including the current game's day
              for (var day = oldGame.currentDay;
                  day < newGame.currentDay;
                  day++) {
                //report unattended events
                await _eventManager.reportUnattendedEventsToDaysJournal.execute(
                  dayToCheckForEvents: day,
                  gameID: newGame.id,
                  mainPlayerID: newGameCurrentPlayerId,
                  dayToLogReportTo: newGame.currentDay,
                );

                //run scheduled events
                await _eventManager.runScheduledEventsForTheDay.execute(
                  gameID: newGame.id,
                  playerID: newGameCurrentPlayerId,
                  dayToCheckForEvents: day,
                  dayToLogEventTo: newGame.currentDay,
                  currentTimeInMinutes: Time.minutesInADay,
                  //we want the entire days events to run
                );
              }
            }

            //PRESENT
            //run scheduled events for the current day
            await _eventManager.runScheduledEventsForTheDay.execute(
              gameID: newGame.id,
              playerID: newGameCurrentPlayerId,
              dayToCheckForEvents: newGame.currentDay,
              dayToLogEventTo: newGame.currentDay,
              currentTimeInMinutes: newGame.currentTimeInMinutes,
            );
          }
        }
      }
    }
  }
}
