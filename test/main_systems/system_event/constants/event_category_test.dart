// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/event_category.dart';

void main() {
  group("EventCategory: ", () {
    test("unmovableAutonomousEvent is an event category", () {
      assert(
        EventCategory.unmovableAutonomousEvent is EventCategory,
      );
    });

    test("movableAutonomousEvent is an event category", () {
      assert(
        EventCategory.movableAutonomousEvent is EventCategory,
      );
    });

    test("attendableEvent is an event category", () {
      assert(
        EventCategory.attendableEvent is EventCategory,
      );
    });

    test("journalOnlyEvent is an event category", () {
      assert(
        EventCategory.journalOnlyEvent is EventCategory,
      );
    });
  });
}
