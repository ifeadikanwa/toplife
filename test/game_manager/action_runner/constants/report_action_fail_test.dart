import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_manager/action_runner/constants/report_action_fail.dart';

void main() {
  group("ReportActionFail:", () {
    test(
      "none description is correct",
      () => expect(
        ReportActionFail.none.description,
        "",
      ),
    );

    test(
      "lowStats description is correct",
      () => expect(
        ReportActionFail.lowStats.description,
        "It looks like you do not have enough stats to perform this action",
      ),
    );
  });
}
