import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/date_and_time/day_and_minutes.dart';
import 'package:toplife/core/utils/date_and_time/get_minutes_between_two_times.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';
import 'package:toplife/game_manager/domain/usecases/control_game/decay_and_alter_player_stats_usecase.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';

class GameControllerUsecase {
  final DecayAndAlterPlayerStatsUsecase _decayAndAlterPlayerStatsUsecase;

  const GameControllerUsecase(
    this._decayAndAlterPlayerStatsUsecase,
  );

  Future<void> execute({
    required Future<Game?>? previousGameFuture,
    required Future<Game?> nextGameFuture,
    required BuildContext context,
    required EventManager eventManager,
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


          //Alter player stats:
          await _decayAndAlterPlayerStatsUsecase.execute(
            playerID: newGame.currentPlayerID,
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
              await eventManager
                  .manageEvents.reportUnattendedEventsToDaysJournal
                  .execute(
                dayToCheckForEvents: day,
                gameID: newGame.id,
                mainPlayerID: newGame.currentPlayerID,
                dayToLogReportTo: newGame.currentDay,
              );

              //we check that the build contect is valid
              if (context.mounted) {
                //run scheduled events
                await eventManager.manageEvents.runScheduledEventsForTheDay
                    .execute(
                  gameID: newGame.id,
                  playerID: newGame.currentPlayerID,
                  day: day,
                  currentTimeInMinutes: Time
                      .minutesInADay, //we want the entire days events to run
                  context: context,
                );
              }
            }
          }

          //PRESENT
          if (context.mounted) {
            //run scheduled events for the current day
            await eventManager.manageEvents.runScheduledEventsForTheDay.execute(
              gameID: newGame.id,
              playerID: newGame.currentPlayerID,
              day: newGame.currentDay,
              currentTimeInMinutes: newGame.currentTimeInMinutes,
              context: context,
            );
          }
        }
      }
    }
  }
}
