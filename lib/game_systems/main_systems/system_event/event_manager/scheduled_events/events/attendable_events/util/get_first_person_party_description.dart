import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/events/attendable_events/util/party_event_descriptions.dart';

class GetFirstPersonPartyDescription {
  static String execute({
    required String eventMainPersonGender,
  }) {
    final wasGoodParty = Chance.getTrueOrFalseBasedOnPercentageChance(
      trueChancePercentage: 70,
    );

    if (wasGoodParty) {
      return PartyEventDescriptions.getRandomFirstPersonGoodPartyDescription(
        eventMainPersonGender,
      );
    } else {
      return PartyEventDescriptions.getRandomFirstPersonGoodPartyDescription(
        eventMainPersonGender,
      );
    }
  }
}
