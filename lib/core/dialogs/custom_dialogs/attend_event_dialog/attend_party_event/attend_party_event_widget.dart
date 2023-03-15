import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/custom_dialogs/attend_event_dialog/attend_party_event/attend_party_event_dialog_view_model.dart';
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
import 'package:toplife/main_systems/system_event/domain/model/info_models/attend_party_detail.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';

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
    final AttendPartyDetail partyDetails =
        ref.watch(attendPartyEventDialogViewModelProvider);
    final AttendPartyEventDialogViewModel attendPartyEventDialogViewModel =
        ref.watch(attendPartyEventDialogViewModelProvider.notifier);

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

        //stay duration
        const DialogDropdownLabelText(text: DialogConstants.stayDurationPrompt),
        stayDurationDropdown(
          attendPartyEventDialogViewModel,
          partyDetails.partyStayDuration,
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalDropdownSpacing,
        ),

        //party activity
        partyWidgets(attendPartyEventDialogViewModel, partyDetails),
        const AddVerticalSpace(
            height: DialogConstants.verticalDescriptionButtonSpacing),

        //buttons
        (hasActivePartner)
            ? DialogEventChoicesToWidgets(
                eventChoices: [
                  EventChoice(
                    choiceDescription: DialogConstants.attendAlone,
                    choiceAction: (BuildContext context) async {
                      attendPartyAlone(
                        context: context,
                        event: event,
                        mainPlayerID: mainPlayerID,
                        eventMainPerson: eventMainPerson,
                        relationshipLabel: relationshipLabel,
                        chosenEventStayDuration: partyDetails.partyStayDuration,
                        chosenGift: partyDetails.itemGift,
                        chosenMoneyGiftAmount: partyDetails.moneyGift,
                        chosenPartyEventActivity:
                            partyDetails.partyEventActivity,
                      );
                    },
                  ),
                  EventChoice(
                    choiceDescription: DialogConstants.attendWithPartner,
                    choiceAction: (BuildContext context) {
                      attendPartyWithPartner(
                        context: context,
                        event: event,
                        mainPlayerID: mainPlayerID,
                        eventMainPerson: eventMainPerson,
                        relationshipLabel: relationshipLabel,
                        chosenEventStayDuration: partyDetails.partyStayDuration,
                        chosenGift: partyDetails.itemGift,
                        chosenMoneyGiftAmount: partyDetails.moneyGift,
                        chosenPartyEventActivity:
                            partyDetails.partyEventActivity,
                      );
                    },
                  ),
                ],
              )
            : DialogEventChoicesToWidgets(
                eventChoices: [
                  EventChoice(
                    choiceDescription: DialogConstants.attend,
                    choiceAction: (BuildContext context) {
                      attendPartyAlone(
                        context: context,
                        event: event,
                        mainPlayerID: mainPlayerID,
                        eventMainPerson: eventMainPerson,
                        relationshipLabel: relationshipLabel,
                        chosenEventStayDuration: partyDetails.partyStayDuration,
                        chosenGift: partyDetails.itemGift,
                        chosenMoneyGiftAmount: partyDetails.moneyGift,
                        chosenPartyEventActivity:
                            partyDetails.partyEventActivity,
                      );
                    },
                  ),
                ],
              ),
      ],
    );
  }

  Widget partyWidgets(
    AttendPartyEventDialogViewModel attendPartyEventDialogViewModel,
    AttendPartyDetail partyDetails,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //activity
        const DialogDropdownLabelText(
          text: DialogConstants.partyActivityPrompt,
        ),
        partyActivityDropdown(
          attendPartyEventDialogViewModel,
          partyDetails.partyEventActivity,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),

        //gift
        const DialogDropdownLabelText(text: DialogConstants.giftItemPrompt),
        bringGiftDropDown(
          attendPartyEventDialogViewModel,
          giftOptionsInStorage,
          partyDetails.itemGift,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),

        //money gift
        DialogDropdownLabelText(
            text:
                "${DialogConstants.moneyGiftPrompt} $currency${partyDetails.moneyGift}"),
        moneyGiftSlider(
          attendPartyEventDialogViewModel,
          partyDetails.moneyGift,
          maxPlayerMoney,
        ),
      ],
    );
  }

  DialogDropdown bringGiftDropDown(
    AttendPartyEventDialogViewModel attendPartyEventDialogViewModel,
    List<StoreroomItemPair> giftOptionsInStorage,
    StoreroomItemPair? chosenItemGift,
  ) {
    //add null to the list of gift options
    List<StoreroomItemPair?> giftOptions = [
      null,
      ...giftOptionsInStorage,
    ];

    //dropdown
    return DialogDropdown<StoreroomItemPair?>(
      value: chosenItemGift,
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
      onChanged: (value) =>
          attendPartyEventDialogViewModel.updateItemGift(value),
    );
  }

  DialogDropdown stayDurationDropdown(
    AttendPartyEventDialogViewModel attendPartyEventDialogViewModel,
    EventStayDuration chosenPartyStayDuration,
  ) {
    return DialogDropdown<EventStayDuration>(
      value: chosenPartyStayDuration,
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
          attendPartyEventDialogViewModel.updatePartyStayDuration(value!),
    );
  }

  DialogDropdown partyActivityDropdown(
    AttendPartyEventDialogViewModel attendPartyEventDialogViewModel,
    PartyEventActivity chosenPartyActivity,
  ) {
    return DialogDropdown<PartyEventActivity>(
      value: chosenPartyActivity,
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
          attendPartyEventDialogViewModel.updatePartyEventActivity(value!),
    );
  }

  DialogSlider moneyGiftSlider(
      AttendPartyEventDialogViewModel attendPartyEventDialogViewModel,
      double chosenMoneyGift,
      int maxPlayerMoney) {
    return DialogSlider(
      value: chosenMoneyGift,
      max: maxPlayerMoney.toDouble(),
      onChanged: (value) => attendPartyEventDialogViewModel.updateMoneyGift(
        value.roundToDouble(),
      ),
    );
  }
}
