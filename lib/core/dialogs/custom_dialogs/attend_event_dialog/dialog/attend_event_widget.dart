import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/custom_dialogs/attend_event_dialog/attend_event_dialogs_text_constants.dart';
import 'package:toplife/core/dialogs/custom_dialogs/attend_event_dialog/dialog/attend_event_dialog_view_model.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_slider.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';
import 'package:toplife/main_systems/system_event/constants/party_event_activity.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/attend_event_detail.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';

class AttendEventWidget extends ConsumerWidget {
  final Event event;
  final int mainPlayerID;
  final Person eventMainPerson;
  final String eventTitle;
  final String secondPersonEventDescription;
  final String relationshipLabel;
  final bool isParty; //if isnt a party, it is a regular event

  const AttendEventWidget({
    Key? key,
    required this.event,
    required this.eventMainPerson,
    required this.mainPlayerID,
    required this.eventTitle,
    required this.secondPersonEventDescription,
    required this.relationshipLabel,
    required this.isParty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventDetailsProvider = ref.watch(attendEventDialogViewModelProvider);
    final AttendEventDialogViewModel attendEventDialogViewModel =
        ref.watch(attendEventDialogViewModelProvider.notifier);

    return eventDetailsProvider.when(
      data: (eventDetails) {
        return (eventDetails != null)
            ? DialogContainer(
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
                    const DialogDropdownLabelText(
                        text:
                            AttendEventDialogsTextConstants.stayDurationPrompt),
                    stayDurationDropdown(
                      attendEventDialogViewModel,
                      eventDetails.partyStayDuration,
                    ),
                    const AddVerticalSpace(
                      height: DialogConstants.verticalDropdownSpacing,
                    ),

                    //party widgets (show only if this is for a party)
                    (isParty)
                        ? partyWidgets(attendEventDialogViewModel, eventDetails)
                        : const SizedBox(),

                    //attend with
                    const DialogDropdownLabelText(
                        text: AttendEventDialogsTextConstants.attendPrompt),
                    attendWithDropdown(
                      attendEventDialogViewModel,
                      eventDetails.attendWithPartner,
                    ),

                    const AddVerticalSpace(
                      height: DialogConstants.verticalDescriptionButtonSpacing,
                    ),

                    //buttons
                    ElevatedButton(
                      child: const Text(TextConstants.attend),
                      onPressed: () {
                        //return party detail
                        AutoRouter.of(context).pop(eventDetails);
                      },
                    ),
                  ])
            : const SizedBox();
      },
      loading: () => const SizedBox(),
      error: (error, stacktrace) => const SizedBox(),
    );
  }

  Widget partyWidgets(
    AttendEventDialogViewModel attendEventDialogViewModel,
    AttendEventDetail eventDetails,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //activity
        const DialogDropdownLabelText(
          text: AttendEventDialogsTextConstants.partyActivityPrompt,
        ),
        partyActivityDropdown(
          attendEventDialogViewModel,
          eventDetails.partyEventActivity,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),

        //gift
        const DialogDropdownLabelText(
            text: AttendEventDialogsTextConstants.giftItemPrompt),
        bringGiftDropDown(
          attendEventDialogViewModel,
          eventDetails.itemGift,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),

        //money gift
        DialogDropdownLabelText(
            text:
                "${AttendEventDialogsTextConstants.moneyGiftPrompt} ${attendEventDialogViewModel.getPlayerCurrency()}${eventDetails.moneyGift}"),
        moneyGiftSlider(
          attendEventDialogViewModel,
          eventDetails.moneyGift,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
      ],
    );
  }

  DialogDropdown bringGiftDropDown(
    AttendEventDialogViewModel attendEventDialogViewModel,
    StoreroomItemPair? chosenItemGift,
  ) {
    //add null to the list of gift options
    List<StoreroomItemPair?> giftOptions = [
      null,
      ...attendEventDialogViewModel.getGiftOptionsInStorage(),
    ];

    //dropdown
    return DialogDropdown<StoreroomItemPair?>(
      value: chosenItemGift,
      items: giftOptions
          .map(
            (giftOption) => DropdownMenuItem(
              value: giftOption,
              child: DialogBodyText(
                text: giftOption?.item.name ?? TextConstants.none,
              ),
            ),
          )
          .toList(),
      onChanged: (value) => attendEventDialogViewModel.updateItemGift(value),
    );
  }

  DialogDropdown stayDurationDropdown(
    AttendEventDialogViewModel attendEventDialogViewModel,
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
          attendEventDialogViewModel.updatePartyStayDuration(value!),
    );
  }

  DialogDropdown partyActivityDropdown(
    AttendEventDialogViewModel attendEventDialogViewModel,
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
          attendEventDialogViewModel.updatePartyEventActivity(value!),
    );
  }

  DialogDropdown attendWithDropdown(
    AttendEventDialogViewModel attendEventDialogViewModel,
    bool attendWithPartner,
  ) {
    return DialogDropdown<bool>(
      value: attendWithPartner,
      items: attendEventDialogViewModel
          .getAttendWithOptions()
          .map(
            (attendWithPartner) => DropdownMenuItem(
              value: attendWithPartner,
              child: DialogBodyText(
                text: (attendWithPartner)
                    ? TextConstants.attendWithPartner
                    : TextConstants.attendAlone,
              ),
            ),
          )
          .toList(),
      onChanged: (value) =>
          attendEventDialogViewModel.updateAttendWithPartner(value!),
    );
  }

  DialogSlider moneyGiftSlider(
    AttendEventDialogViewModel attendEventDialogViewModel,
    double chosenMoneyGift,
  ) {
    return DialogSlider(
      value: chosenMoneyGift,
      max: attendEventDialogViewModel.getMaxPlayerMoney().toDouble(),
      onChanged: (value) => attendEventDialogViewModel.updateMoneyGift(
        value.roundToDouble(),
      ),
    );
  }
}
