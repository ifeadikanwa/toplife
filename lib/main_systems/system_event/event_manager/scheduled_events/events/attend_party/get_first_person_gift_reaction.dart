import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_party/party_event_descriptions.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';

class GetFirstPersonGiftReaction {
  static String execute({
    required Person eventMainPerson,
    required StoreroomItemPair? chosenGift,
    required double chosenMoneyGiftAmount,
  }) {
    late final String firstPersonGiftReaction;

    //if no gift
    if (chosenGift == null && chosenMoneyGiftAmount <= 0) {
      firstPersonGiftReaction =
          PartyEventDescriptions.getRandomFirstPersonNoGiftReaction(
        eventMainPerson.gender,
      );
    }
    //if money gift is big
    else if (chosenMoneyGiftAmount > 100) {
      firstPersonGiftReaction =
          PartyEventDescriptions.getRandomFirstPersonGoodGiftReaction(
        eventMainPerson.gender,
      );
    }
    //if there is item gift
    else if (chosenGift != null) {
      final recipientLikesGift = Chance.getTrueOrFalse();

      if (recipientLikesGift) {
        firstPersonGiftReaction =
            PartyEventDescriptions.getRandomFirstPersonGoodGiftReaction(
          eventMainPerson.gender,
        );
      } else {
        firstPersonGiftReaction =
            PartyEventDescriptions.getRandomFirstPersonBadGiftReaction(
          eventMainPerson.gender,
        );
      }
    }
    //small money gift
    else {
      firstPersonGiftReaction =
          PartyEventDescriptions.getRandomFirstPersonBadGiftReaction(
        eventMainPerson.gender,
      );
    }

    return firstPersonGiftReaction;
  }
}
