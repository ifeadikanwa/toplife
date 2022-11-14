import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_event_choices_to_buttons.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_slider.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';
import 'package:toplife/main_systems/system_event/constants/party_event_activity.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';

final giftProvider =
    StateProvider.autoDispose<StoreroomItemPair?>(
  (ref) => null,
);

final partyStayDurationProvider =
    StateProvider.autoDispose<EventStayDuration>((ref) => EventStayDuration.tillTheEnd);

final partyActivityProvider =
    StateProvider.autoDispose<PartyEventActivity>((ref) => PartyEventActivity.socialize);

final moneyGiftProvider = StateProvider.autoDispose<double>((ref) => 0);

class AttendPartyEventWidget extends ConsumerWidget {
  final Event event;
  final int mainPlayerID;
  final Person eventMainPerson;
  final String eventTitle;
  final String secondPersonEventDescription;
  final String relationshipLabel;
  final bool hasActivePartner;
  final String currency;
  final int maxPlayerMoney;
  final List<StoreroomItemPair> giftOptionsInStorage;
  final Future<void> Function({
    required BuildContext context,
    required Event event,
    required int mainPlayerID,
    required Person eventMainPerson,
    required String relationshipLabel,
    required EventStayDuration chosenEventStayDuration,
    required StoreroomItemPair? chosenGift,
    required double chosenMoneyGiftAmount,
    required PartyEventActivity chosenPartyEventActivity,
  }) attendPartyAlone;
  final Future<void> Function({
    required BuildContext context,
    required Event event,
    required int mainPlayerID,
    required Person eventMainPerson,
    required String relationshipLabel,
    required EventStayDuration chosenEventStayDuration,
    required StoreroomItemPair? chosenGift,
    required double chosenMoneyGiftAmount,
    required PartyEventActivity chosenPartyEventActivity,
  }) attendPartyWithPartner;

  const AttendPartyEventWidget({
    Key? key,
    required this.event,
    required this.eventMainPerson,
    required this.mainPlayerID,
    required this.eventTitle,
    required this.secondPersonEventDescription,
    required this.relationshipLabel,
    required this.hasActivePartner,
    required this.currency,
    required this.maxPlayerMoney,
    required this.giftOptionsInStorage,
    required this.attendPartyAlone,
    required this.attendPartyWithPartner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EventStayDuration chosenEventStayDuration =
        ref.watch(partyStayDurationProvider);
    final StoreroomItemPair? chosenGift = ref.watch(giftProvider);
    final double chosenMoneyGiftAmount = ref.watch(moneyGiftProvider);
    final PartyEventActivity chosenPartyEventActivity =
        ref.watch(partyActivityProvider);

    return DialogContainer(
      closeable: true,
      title: DialogTitleText(
        text: eventTitle,
      ),
      children: [
        DialogBodyText(
          text: secondPersonEventDescription,
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalDropdownSpacing,
        ),
        const DialogDropdownLabelText(text: DialogConstants.stayDurationPrompt),
        stayDurationDropdown(ref),
        const AddVerticalSpace(
          height: DialogConstants.verticalDropdownSpacing,
        ),
        partyWidgets(ref),
        const AddVerticalSpace(
            height: DialogConstants.verticalDescriptionButtonSpacing),
        (hasActivePartner)
            ? DialogEventChoicesToWidgets(
                eventChoices: [
                  EventChoice(
                    choiceDescription: "Attend alone",
                    choiceAction: (BuildContext context) async {
                      attendPartyAlone(
                        context: context,
                        event: event,
                        mainPlayerID: mainPlayerID,
                        eventMainPerson: eventMainPerson,
                        relationshipLabel: relationshipLabel,
                        chosenEventStayDuration: chosenEventStayDuration,
                        chosenGift: chosenGift,
                        chosenMoneyGiftAmount: chosenMoneyGiftAmount,
                        chosenPartyEventActivity: chosenPartyEventActivity,
                      );
                    },
                  ),
                  EventChoice(
                    choiceDescription: "Attend with partner",
                    choiceAction: (BuildContext context) {
                      attendPartyWithPartner(
                        context: context,
                        event: event,
                        mainPlayerID: mainPlayerID,
                        eventMainPerson: eventMainPerson,
                        relationshipLabel: relationshipLabel,
                        chosenEventStayDuration: chosenEventStayDuration,
                        chosenGift: chosenGift,
                        chosenMoneyGiftAmount: chosenMoneyGiftAmount,
                        chosenPartyEventActivity: chosenPartyEventActivity,
                      );
                    },
                  ),
                ],
              )
            : DialogEventChoicesToWidgets(
                eventChoices: [
                  EventChoice(
                    choiceDescription: "Attend",
                    choiceAction: (BuildContext context) {
                      attendPartyAlone(
                        context: context,
                        event: event,
                        mainPlayerID: mainPlayerID,
                        eventMainPerson: eventMainPerson,
                        relationshipLabel: relationshipLabel,
                        chosenEventStayDuration: chosenEventStayDuration,
                        chosenGift: chosenGift,
                        chosenMoneyGiftAmount: chosenMoneyGiftAmount,
                        chosenPartyEventActivity: chosenPartyEventActivity,
                      );
                    },
                  ),
                ],
              ),
      ],
    );
  }

  Widget partyWidgets(WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //activity
        const DialogDropdownLabelText(
            text: "What do you want to do at the event?"),
        partyActivityDropdown(ref),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),

        //gift
        const DialogDropdownLabelText(text: "Bring a gift:"),
        bringGiftDropDown(
          ref,
          giftOptionsInStorage,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),

        //money gift
        DialogDropdownLabelText(
            text: "Give money: $currency${ref.watch(moneyGiftProvider)}"),
        moneyGiftSlider(
          ref,
          maxPlayerMoney,
        ),
      ],
    );
  }

  DialogDropdown bringGiftDropDown(
    WidgetRef ref,
    List<StoreroomItemPair> giftOptionsInStorage,
  ) {
    List<StoreroomItemPair?> giftOptions = [
      null,
      ...giftOptionsInStorage,
    ];
    return DialogDropdown<StoreroomItemPair?>(
      value: ref.watch(giftProvider),
      items: giftOptions
          .map(
            (giftOption) => DropdownMenuItem(
              value: giftOption,
              child: DialogBodyText(
                text: giftOption?.item.name ?? DialogConstants.none,
              ),
            ),
          )
          .toList(),
      onChanged: (value) => ref.read(giftProvider.notifier).state = value,
    );
  }

  DialogDropdown stayDurationDropdown(WidgetRef ref) {
    return DialogDropdown<EventStayDuration>(
      value: ref.watch(partyStayDurationProvider),
      items: EventStayDuration.values
          .map(
            (stayDuration) => DropdownMenuItem(
              value: stayDuration,
              child: DialogBodyText(
                text: stayDuration.fullName,
              ),
            ),
          )
          .toList(),
      onChanged: (value) =>
          ref.read(partyStayDurationProvider.notifier).state = value!,
    );
  }

  DialogDropdown partyActivityDropdown(WidgetRef ref) {
    return DialogDropdown<PartyEventActivity>(
      value: ref.watch(partyActivityProvider),
      items: PartyEventActivity.values
          .map(
            (partyActivity) => DropdownMenuItem(
              value: partyActivity,
              child: DialogBodyText(
                text: partyActivity.fullName,
              ),
            ),
          )
          .toList(),
      onChanged: (value) =>
          ref.read(partyActivityProvider.notifier).state = value!,
    );
  }

  DialogSlider moneyGiftSlider(WidgetRef ref, int maxPlayerMoney) {
    return DialogSlider(
      value: ref.watch(moneyGiftProvider),
      max: maxPlayerMoney.toDouble(),
      onChanged: (value) =>
          ref.read(moneyGiftProvider.notifier).state = value.roundToDouble(),
    );
  }
}
