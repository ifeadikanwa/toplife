import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/action_duration.dart';

void main() {
  group("ActionDuration:", () {
    test("none creates the correct instance", () {
      final ActionDuration result = ActionDuration.none();

      expect(
        result.durationInMinutes,
        0,
        reason: "Cause: durationInMinutes",
      );

      expect(
        result.startTimeInMinutes,
        null,
        reason: "Cause: startTimeInMinutes",
      );

      expect(
        result.endTimeInMinutes,
        null,
        reason: "Cause: endTimeInMinutes",
      );
    });

    test("untimed creates the correct instance", () {
      final ActionDuration result =
          ActionDuration.untimed(durationInMinutes: 30);

      expect(
        result.durationInMinutes,
        30,
        reason: "Cause: durationInMinutes",
      );

      expect(
        result.startTimeInMinutes,
        null,
        reason: "Cause: startTimeInMinutes",
      );

      expect(
        result.endTimeInMinutes,
        null,
        reason: "Cause: endTimeInMinutes",
      );
    });

    test("timed creates the correct instance", () {
      final ActionDuration result = ActionDuration.timed(
        startTimeInMinutes: 900,
        endTimeInMinutes: 1000,
      );

      expect(
        result.durationInMinutes,
        100,
        reason: "Cause: durationInMinutes",
      );

      expect(
        result.startTimeInMinutes,
        900,
        reason: "Cause: startTimeInMinutes",
      );

      expect(
        result.endTimeInMinutes,
        1000,
        reason: "Cause: endTimeInMinutes",
      );
    });
  });
}
