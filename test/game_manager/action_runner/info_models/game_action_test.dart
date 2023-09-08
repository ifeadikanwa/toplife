import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_manager/action_runner/constants/report_action_fail.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_result.dart';
import 'package:toplife/game_manager/action_runner/info_models/game_action.dart';

void main() {
  group("GameAction:", () {
    test("doNothingOnLowPerformance return te correct action result", () {
      defaultPerformance() async {
        return const ActionResult(
          isSuccessful: true,
          reportActionFail: ReportActionFail.none,
        );
      }

      final GameAction result = GameAction.doNothingOnLowPerformance(
        defaultPerformance: defaultPerformance,
      );

      expect(
        result.defaultPerformance,
        defaultPerformance,
        reason: "Cause: defaultPerformance",
      );

      expect(
        result.lowPerformance,
        GameAction.doNothingAndReportLowStatsAction,
        reason: "Cause: lowPerformance",
      );
    });

    test("doDefaultOnLowPerformance return te correct action result", () {
      defaultPerformance() async {
        return const ActionResult(
          isSuccessful: true,
          reportActionFail: ReportActionFail.none,
        );
      }

      final GameAction result = GameAction.doDefaultOnLowPerformance(
        defaultPerformance: defaultPerformance,
      );

      expect(
        result.defaultPerformance,
        defaultPerformance,
        reason: "Cause: defaultPerformance",
      );

      expect(
        result.lowPerformance,
        defaultPerformance,
        reason: "Cause: lowPerformance",
      );
    });

    test("doCustomOnLowPerformance return te correct action result", () {
      defaultPerformance() async {
        return const ActionResult(
          isSuccessful: true,
          reportActionFail: ReportActionFail.none,
        );
      }

      lowPerformance() async {
        return const ActionResult(
          isSuccessful: true,
          reportActionFail: ReportActionFail.lowStats,
        );
      }

      final GameAction result = GameAction.doCustomOnLowPerformance(
        defaultPerformance: defaultPerformance,
        lowPerformance: lowPerformance,
      );

      expect(
        result.defaultPerformance,
        defaultPerformance,
        reason: "Cause: defaultPerformance",
      );

      expect(
        result.lowPerformance,
        lowPerformance,
        reason: "Cause: lowPerformance",
      );
    });

    test("doNothingAndReportLowStatsAction returns the correct action result",
        () async {
      final ActionResult result =
          await GameAction.doNothingAndReportLowStatsAction();

      expect(
        result,
        const ActionResult(
          isSuccessful: false,
          reportActionFail: ReportActionFail.lowStats,
        ),
      );
    });
  });
}
