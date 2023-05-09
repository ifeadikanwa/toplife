import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/schedule_event.dart';

void main() {
  group("Schedule Event:", () {
    test("maxAutonomousDialogEventsInADay is 3",
        () => expect(ScheduleEvent.maxAutonomousDialogEventsInADay, 3));
  });
}
