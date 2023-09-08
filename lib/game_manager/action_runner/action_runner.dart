import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/game_manager/action_runner/constants/report_action_fail.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_result.dart';
import 'package:toplife/game_manager/action_runner/info_models/affected_by_stats.dart';
import 'package:toplife/game_manager/domain/usecases/get_current_game_and_player_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/get_game_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/move_time_forward_usecase.dart';
import 'package:toplife/main_systems/system_transportation/constants/travel_type.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_detail.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_duration.dart';
import 'package:toplife/main_systems/system_transportation/domain/model/travel_detail.dart';
import 'package:toplife/game_manager/action_runner/utils/get_list_of_low_stats.dart';
import 'package:toplife/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/main_systems/system_person/constants/person_stats.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_transportation/domain/model/travel_response.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/land_travel_usecase.dart';

class ActionRunner {
  final MoveTimeForwardUsecase _moveTimeForwardUsecase;
  final GetGameUsecase _getGameUsecase;
  final GetCurrentGameAndPlayerUsecase _getCurrentGameAndPlayerUsecase;
  final PersonUsecases _personUsecases;

  const ActionRunner(
    this._moveTimeForwardUsecase,
    this._getGameUsecase,
    this._getCurrentGameAndPlayerUsecase,
    this._personUsecases,
  );

  Future<void> performNoTravelAction({
    required BuildContext context,
    required LandTravelUsecase landTravelUsecase,
    required ActionDetail actionDetail,
  }) {
    return _perform(
      context: context,
      landTravelUsecase: landTravelUsecase,
      actionDetail: actionDetail,
      travelDetail: null,
      travelType: TravelType.none,
    );
  }

  //has no action duration
  Future<void> performOneWayTravelAction({
    required BuildContext context,
    required LandTravelUsecase landTravelUsecase,
    required ActionDetail actionDetail,
    required TravelDetail travelDetail,
  }) {
    return _perform(
      context: context,
      landTravelUsecase: landTravelUsecase,
      actionDetail: actionDetail.copyWith(
        actionDuration: ActionDuration.none(),
      ),
      travelDetail: travelDetail,
      travelType: TravelType.oneWay,
    );
  }

  Future<void> performTwoWayTravelAction({
    required BuildContext context,
    required LandTravelUsecase landTravelUsecase,
    required ActionDetail actionDetail,
    required TravelDetail travelDetail,
  }) {
    return _perform(
      context: context,
      landTravelUsecase: landTravelUsecase,
      actionDetail: actionDetail,
      travelDetail: travelDetail,
      travelType: TravelType.twoWay,
    );
  }

  //main
  Future<void> _perform({
    required BuildContext context,
    required LandTravelUsecase landTravelUsecase,
    required ActionDetail actionDetail,
    required TravelDetail? travelDetail,
    required TravelType travelType,
  }) async {
    //player and game
    final PersonGamePair? currentGameAndPlayer =
        await _getCurrentGameAndPlayerUsecase.execute();

    //if game and player is valid
    if (currentGameAndPlayer != null) {
      //get player stats
      final Stats? playerStats = await _personUsecases.getPersonStatsUsecase
          .execute(currentGameAndPlayer.person.id);

      //if stats are valid
      if (playerStats != null) {
        //if energy is less than or equal to 0, we tell the player and don't do anything
        if (playerStats.energy <= 0) {
          if (context.mounted) {
            return ResultDialog.show(
              context: context,
              title: "What?? Where?? How??",
              result:
                  "What was I going to do again? The room is currently spinning, I think I need to lay down",
            );
          }
        }
        //there's enough energy to do something
        else {
          //handle travel
          if (travelDetail != null) {
            //check if context is valid
            if (context.mounted) {
              //travel
              final TravelResponse travelResponse =
                  await landTravelUsecase.execute(
                context: context,
                moveTimeForwardUsecase: _moveTimeForwardUsecase,
                getGameUsecase: _getGameUsecase,
                currentGameID: currentGameAndPlayer.game.id,
                travellerPersonID: currentGameAndPlayer.person.id,
                npcPassengersPersonIDs: [],
                eventStartTimeInMinutes:
                    actionDetail.actionDuration.startTimeInMinutes,
                travelType: travelType,
                travelDetail: travelDetail,
              );

              //if travel is not successful we assume they didnt get to their destination so we cant run the action
              if (!travelResponse.isSuccesful) {
                return;
              }
            }
            //if we need to travel but we couldnt because of context error, I would rather we do nothing at all
            //than we keep going and have a buggy situation where the action ran but we didnt travel.
            else {
              return;
            }
          }

          //if travel is not needed or travel is successful, we get here
          late final bool isLowPerformanceGameAction;

          final AffectedByStats affectedByStats = actionDetail.affectedByStats;

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

          //run game action
          final Future<ActionResult> Function() gameAction =
              (isLowPerformanceGameAction)
                  ? actionDetail.gameAction.lowPerformance
                  : actionDetail.gameAction.defaultPerformance;

          final ActionResult actionResult = await gameAction();

          //check if action failed and a report is requested
          if (!actionResult.isSuccessful &&
              actionResult.reportActionFail != ReportActionFail.none) {
            //send a result dialog
            if (context.mounted) {
              return ResultDialog.show(
                context: context,
                title: "Oh No!",
                result: actionResult.reportActionFail.description,
              );
            }
          }

          //if actions succeeded, move time forward by action duration ONLY
          else {
            await _moveTimeForwardUsecase.execute(
              gameID: currentGameAndPlayer.game.id,
              timeInMinutes: actionDetail.actionDuration.durationInMinutes,
            );
          }
        }
      }
    }
  }
}
