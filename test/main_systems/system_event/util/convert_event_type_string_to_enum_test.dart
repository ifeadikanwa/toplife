import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/game_systems/main_systems/system_event/util/convert_event_type_string_to_enum.dart';

void main() {
  group("convertEventTypeStringToEnum:", () {
    test(
        "returns the correct event type when given a valid event type string",
        () => expect(
              convertEventTypeStringToEnum(EventType.values.first.name),
              EventType.values.first,
            ));

              test(
        "returns null when given a invalid event type string",
        () => expect(
              convertEventTypeStringToEnum("wrong"),
              null,
            ));
  });
}
