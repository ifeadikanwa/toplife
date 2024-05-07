import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_event/util/get_attendable_event_location.dart';

void main() {
 group("getAttendableEventLocation:", () { 
  test("returns the correct string response", () => expect(getAttendableEventLocation(state: "state", country: "country",), "Location: state, country",),);
 });
}