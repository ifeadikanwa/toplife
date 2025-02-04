import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/party_event_activity.dart';

void main() {
  group("Party event activity:", () {
    test(
      "getDrunk full name is Get drunk",
      () {
        expect(PartyEventActivity.getDrunk.fullName, "Get drunk");
      },
    );

     test(
      "socialize full name is Socialize",
      () {
        expect(PartyEventActivity.socialize.fullName, "Socialize");
      },
    ); test(
      "standInCorner full name is Stand in corner",
      () {
        expect(PartyEventActivity.standInCorner.fullName, "Stand in corner");
      },
    ); test(
      "dancedancedance full name is Dance dance dance",
      () {
        expect(PartyEventActivity.danceDanceDance.fullName, "Dance dance dance");
      },
    ); test(
      "eatAndLeave full name is Eat and leave",
      () {
        expect(PartyEventActivity.eatAndLeave.fullName, "Eat and leave");
      },
    );
  });
}
