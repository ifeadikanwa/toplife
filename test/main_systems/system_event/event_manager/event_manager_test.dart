import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';

void main() {
  group("Event manager:", () {
    test(
      "event attendance allowance time is 30 minutes",
      () {
        expect(EventManager.eventAttendanceAllowanceTime, 30);
      },
    );
  });
}
