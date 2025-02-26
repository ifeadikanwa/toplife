import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/event_manager.dart';

void main() {
  group("Event manager:", () {
    test(
      "event attendance allowance time is 30 minutes",
      () {
        expect(EventManager.eventAttendanceAllowanceTime, 30);
      },
    );

      test(
      "event minimum attendance time is 30 minutes",
      () {
        expect(EventManager.eventMinimumAttendanceTime, 30);
      },
    );
  });
}
