import 'package:equatable/equatable.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/game_systems/game_manager/action_runner/constants/action_runner_text_constants.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/affected_by_stats.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/report.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/action_result.dart';
import 'package:toplife/game_systems/game_manager/domain/model/info_models/person_game_pair.dart';

//we want to be able to distinguish between player action and background action
//player action: Must pass min energy check before running, most of the actions the player triggers fall in here (includes attendable events). It also lets us define if we want a low performance behaviour.
//Executive action: Bypasses min energy check, most of the actions the game triggers it AND any player action that must always run (includes non-attendable events).
sealed class GameAction extends Equatable {}

//
class ExecutiveAction implements GameAction {
  final Future<ActionResult> Function(
    PersonGamePair currentGameAndPlayer,
    DialogHandler dialogHandler,
  ) action;

  const ExecutiveAction({required this.action});

  @override
  List<Object?> get props => [action];

  @override
  bool? get stringify => true;
}

//
class PlayerAction implements GameAction {
  //I want the game action to take in the current game and player object from the action runner so that the usecase don't need to all do this one thing,
  //the action runner can do it once and everyone can just take it fom them
  final Future<ActionResult> Function(
    PersonGamePair currentGameAndPlayer,
    DialogHandler dialogHandler,
  ) defaultPerformance;
  final Future<ActionResult> Function(
    PersonGamePair currentGameAndPlayer,
    DialogHandler dialogHandler,
  ) lowPerformance;

  final AffectedByStats affectedByStats;

  //private
  const PlayerAction._({
    required this.defaultPerformance,
    required this.lowPerformance,
    required this.affectedByStats,
  });

  //public
  factory PlayerAction.doNothingOnLowPerformance({
    required Future<ActionResult> Function(
      PersonGamePair currentGameAndPlayer,
      DialogHandler dialogHandler,
    ) defaultPerformance,
    required AffectedByStats affectedByStats,
  }) {
    return PlayerAction._(
      defaultPerformance: defaultPerformance,
      lowPerformance: (currentGameAndPlayer, dialogHandler) =>
          doNothingAndReportLowStatsAction(dialogHandler),
      affectedByStats: affectedByStats,
    );
  }

  factory PlayerAction.doDefaultAlways({
    required Future<ActionResult> Function(
      PersonGamePair currentGameAndPlayer,
      DialogHandler dialogHandler,
    ) defaultPerformance,
  }) {
    return PlayerAction._(
      defaultPerformance: defaultPerformance,
      lowPerformance: defaultPerformance,
      affectedByStats: NoStats(),
    );
  }

  factory PlayerAction.doCustomOnLowPerformance({
    required Future<ActionResult> Function(
      PersonGamePair currentGameAndPlayer,
      DialogHandler dialogHandler,
    ) defaultPerformance,
    required Future<ActionResult> Function(
      PersonGamePair currentGameAndPlayer,
      DialogHandler dialogHandler,
    ) lowPerformance,
    required AffectedByStats affectedByStats,
  }) {
    return PlayerAction._(
      defaultPerformance: defaultPerformance,
      lowPerformance: lowPerformance,
      affectedByStats: affectedByStats,
    );
  }

  //helpers
  static Future<ActionResult> doNothingAndReportLowStatsAction(
    DialogHandler dialogHandler,
  ) async {
    return ActionResult.failedWithReport(
      report: Report(
        dialog: dialogHandler.showResultDialog(
          title: ActionRunnerTextConstants.lowStatsDialogTitle,
          result: ActionRunnerTextConstants.lowStatsDialogDesc,
        ),
      ),
    );
  }

  @override
  List<Object?> get props => [
        defaultPerformance,
        lowPerformance,
        affectedByStats,
      ];

  @override
  bool? get stringify => true;
}
