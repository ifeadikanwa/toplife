import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/constants/default_activity_duration.dart';

void main() {
  group("DefaultActivityDuration:", () {
    test("default time to eat is 30m and it cant take longer", () {
      expect(
        DefaultActivityDuration.eat.durationInMinutes,
        30,
        reason: "Cause: duration in minutes",
      );
      expect(
        DefaultActivityDuration.eat.canTakeLonger,
        false,
        reason: "Cause: can take longer",
      );
    });

    test("default time to sleep is 1h and it can take longer", () {
      expect(
        DefaultActivityDuration.sleep.durationInMinutes,
        60,
        reason: "Cause: duration in minutes",
      );
      expect(
        DefaultActivityDuration.sleep.canTakeLonger,
        true,
        reason: "Cause: can take longer",
      );
    });
  });
}
