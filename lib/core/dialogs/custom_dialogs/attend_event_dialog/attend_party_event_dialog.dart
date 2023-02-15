import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/custom_dialogs/attend_event_dialog/attend_party_event_widget.dart';
import 'package:toplife/core/dialogs/dialog_helpers/show_persistent_dialog.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';
import 'package:toplife/main_systems/system_event/constants/party_event_activity.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';

class AttendPartyEventDialog {
  static Future<void> show({
    required BuildContext context,
    required Event event,
    required int mainPlayerID,
    required Person eventMainPerson,
    required String eventTitle,
    required String secondPersonEventDescription,
    required String relationshipLabel,
    required bool hasActivePartner,
    required String currency,
    required int maxPlayerMoney,
    required List<StoreroomItemPair> giftOptionsInStorage,
    required Future<void> Function({
      required BuildContext context,
      required Event event,
      required int mainPlayerID,
      required Person eventMainPerson,
      required String relationshipLabel,
      required EventStayDuration chosenEventStayDuration,
      required StoreroomItemPair? chosenGift,
      required double chosenMoneyGiftAmount,
      required PartyEventActivity chosenPartyEventActivity,
    })
        attendPartyAlone,
    required Future<void> Function({
      required BuildContext context,
      required Event event,
      required int mainPlayerID,
      required Person eventMainPerson,
      required String relationshipLabel,
      required EventStayDuration chosenEventStayDuration,
      required StoreroomItemPair? chosenGift,
      required double chosenMoneyGiftAmount,
      required PartyEventActivity chosenPartyEventActivity,
    })
        attendPartyWithPartner,
  }) async {
    if (context.mounted) {
      return showPersistentDialog(
        context: context,
        child: AttendPartyEventWidget(
          eventTitle: eventTitle,
          event: event,
          mainPlayerID: mainPlayerID,
          eventMainPerson: eventMainPerson,
          secondPersonEventDescription: secondPersonEventDescription,
          relationshipLabel: relationshipLabel,
          hasActivePartner: hasActivePartner,
          currency: currency,
          maxPlayerMoney: maxPlayerMoney,
          giftOptionsInStorage: giftOptionsInStorage,
          attendPartyAlone: attendPartyAlone,
          attendPartyWithPartner: attendPartyWithPartner,
        ),
      );
    }
  }
}
