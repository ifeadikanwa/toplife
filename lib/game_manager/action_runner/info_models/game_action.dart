import 'package:equatable/equatable.dart';
import 'package:toplife/game_manager/action_runner/constants/report_action_fail.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_result.dart';

class GameAction extends Equatable {
  final Future<ActionResult> Function() defaultPerformance;
  final Future<ActionResult> Function() lowPerformance;

  //private
  const GameAction._({
    required this.defaultPerformance,
    required this.lowPerformance,
  });

  //public
  factory GameAction.doNothingOnLowPerformance({
    required Future<ActionResult> Function() defaultPerformance,
  }) {
    return GameAction._(
      defaultPerformance: defaultPerformance,
      lowPerformance: doNothingAndReportLowStatsAction,
    );
  }

  factory GameAction.doDefaultOnLowPerformance({
    required Future<ActionResult> Function() defaultPerformance,
  }) {
    return GameAction._(
      defaultPerformance: defaultPerformance,
      lowPerformance: defaultPerformance,
    );
  }

  factory GameAction.doCustomOnLowPerformance({
    required Future<ActionResult> Function() defaultPerformance,
    required Future<ActionResult> Function() lowPerformance,
  }) {
    return GameAction._(
      defaultPerformance: defaultPerformance,
      lowPerformance: lowPerformance,
    );
  }

  //helpers
  static Future<ActionResult> doNothingAndReportLowStatsAction() async {
    return const ActionResult(
      isSuccessful: false,
      reportActionFail: ReportActionFail.lowStats,
      durationInMinutes: null,
    );
  }

  @override
  List<Object?> get props => [
        defaultPerformance,
        lowPerformance,
      ];
}
