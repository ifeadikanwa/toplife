import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/custom_dialogs/event/attend_event_dialog/attend_event_dialogs_text_constants.dart';
import 'package:toplife/core/dialogs/custom_dialogs/event/attend_event_dialog/dialog/attend_event_dialog_view_model.dart';
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
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';

class AttendEventDialogWidget extends ConsumerWidget {
  final Event event;
  final int mainPlayerID;
  final Person eventMainPerson;
  final String eventTitle;
  final String secondPersonEventDescription;
  final String relationshipLabel;
  final bool isParty; //if isn't a party, it is a regular event

  const AttendEventDialogWidget({
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
    final attendEventDialogViewModel =
        ref.watch(attendEventDialogViewModelProvider);

    return attendEventDialogViewModel.when(
      data: (attendEventDialogData) {
        return (attendEventDialogData != null)
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
                      ref,
                      attendEventDialogData.attendEventDetail.partyStayDuration,
                    ),
                    const AddVerticalSpace(
                      height: DialogConstants.verticalDropdownSpacing,
                    ),

                    //party widgets (show only if this is for a party)
                    (isParty)
                        ? partyWidgets(
                            ref,
                            attendEventDialogData,
                          )
                        : const SizedBox(),

                    //attend with
                    const DialogDropdownLabelText(
                        text: AttendEventDialogsTextConstants.attendPrompt),
                    attendWithDropdown(
                      ref,
                      attendEventDialogData.attendEventDetail.attendWithPartner,
                      attendEventDialogData.attendWithOptions,
                    ),

                    const AddVerticalSpace(
                      height: DialogConstants.verticalDescriptionButtonSpacing,
                    ),

                    //buttons
                    ElevatedButton(
                      child: const Text(TextConstants.attend),
                      onPressed: () {
                        //return party detail
                        AutoRouter.of(context).pop(
                          attendEventDialogData.attendEventDetail,
                        );
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
    WidgetRef ref,
    AttendEventDialogData attendEventDialogData,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //activity
        const DialogDropdownLabelText(
          text: AttendEventDialogsTextConstants.partyActivityPrompt,
        ),
        partyActivityDropdown(
          ref,
          attendEventDialogData.attendEventDetail.partyEventActivity,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),

        //gift
        const DialogDropdownLabelText(
            text: AttendEventDialogsTextConstants.giftItemPrompt),
        bringGiftDropDown(
          ref,
          attendEventDialogData.attendEventDetail.itemGift,
          attendEventDialogData.giftOptionsInStorage,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),

        //money gift
        DialogDropdownLabelText(
            text:
                "${AttendEventDialogsTextConstants.moneyGiftPrompt} ${attendEventDialogData.formattedMoneyGift}"),
        moneyGiftSlider(
          ref,
          attendEventDialogData.attendEventDetail.moneyGift,
          attendEventDialogData.maxPlayerMoney,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
      ],
    );
  }

  DialogDropdown bringGiftDropDown(
    WidgetRef ref,
    StoreroomItemPair? chosenItemGift,
    List<StoreroomItemPair> giftOptionsInStorage,
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
                text: giftOption?.item.name ?? TextConstants.none,
              ),
            ),
          )
          .toList(),
      onChanged: (value) => ref
          .read(attendEventDialogViewModelProvider.notifier)
          .updateItemGift(value),
    );
  }

  DialogDropdown stayDurationDropdown(
    WidgetRef ref,
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
      onChanged: (value) => ref
          .read(attendEventDialogViewModelProvider.notifier)
          .updatePartyStayDuration(value!),
    );
  }

  DialogDropdown partyActivityDropdown(
    WidgetRef ref,
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
      onChanged: (value) => ref
          .read(attendEventDialogViewModelProvider.notifier)
          .updatePartyEventActivity(value!),
    );
  }

  DialogDropdown attendWithDropdown(
    WidgetRef ref,
    bool attendWithPartner,
    List<bool> attendWithOptions,
  ) {
    return DialogDropdown<bool>(
      value: attendWithPartner,
      items: attendWithOptions
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
      onChanged: (value) => ref
          .read(attendEventDialogViewModelProvider.notifier)
          .updateAttendWithPartner(value!),
    );
  }

  DialogSlider moneyGiftSlider(
      WidgetRef ref, double chosenMoneyGift, int maxPlayerMoney) {
    return DialogSlider(
      value: chosenMoneyGift,
      max: maxPlayerMoney.toDouble(),
      onChanged: (value) =>
          ref.read(attendEventDialogViewModelProvider.notifier).updateMoneyGift(
                value.roundToDouble(),
              ),
    );
  }
}
