import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/button/default_elevated_button.dart';
import 'package:toplife/core/common_widgets/button/editable_quantity_widget.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_slider.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/activities/widgets/dialogs/attendable_event_dialog/attendable_event_dialogs_text_constants.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/activities/widgets/dialogs/attendable_event_dialog/dialog/attendable_event_dialog_view_model.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/party_event_activity.dart';
import 'package:toplife/game_systems/main_systems/system_event/domain/model/info_models/event_person_pair.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';

class AttendableEventDialogWidget extends ConsumerWidget {
  final EventPersonPair eventPersonPair;

  const AttendableEventDialogWidget({
    super.key,
    required this.eventPersonPair,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final AttendableEventDialogViewModelProvider viewModelProvider =
        attendableEventDialogViewModelProvider(
      eventPersonPair: eventPersonPair,
    );
    //
    final attendableEventDialogViewModel = ref.watch(viewModelProvider);

    return attendableEventDialogViewModel.when(
      data: (attendableEventDialogData) {
        return (attendableEventDialogData != null)
            ? DialogContainer(
                title: DialogTitleText(
                  text: attendableEventDialogData
                      .attendableEventInfo.eventText.eventTitle,
                ),
                children: [
                    //Event description
                    DialogBodyText(
                      text: attendableEventDialogData
                          .attendableEventInfo.eventText.eventDescription,
                    ),
                    const AddVerticalSpace(
                      height: DialogConstants.verticalDropdownSpacing,
                    ),

                    //Time
                    DialogBodyText(
                      text: attendableEventDialogData
                          .attendableEventInfo.eventTime,
                    ),
                    const AddVerticalSpace(
                      height: DialogConstants.verticalDropdownSpacing,
                    ),

                    //Location
                    DialogBodyText(
                      text: attendableEventDialogData
                          .attendableEventInfo.eventLocation,
                    ),
                    const AddVerticalSpace(
                      height: DialogConstants.verticalDropdownSpacing,
                    ),

                    //stay duration
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const DialogLabelText(
                            text: AttendableEventDialogsTextConstants
                                .stayDurationPrompt),
                        eventLeaveTimeCounter(
                          ref,
                          viewModelProvider,
                          attendableEventDialogData
                              .attendEventDetail.exitTimeInMinutes,
                        ),
                      ],
                    ),
                    const AddVerticalSpace(
                      height: DialogConstants.verticalDropdownSpacing,
                    ),

                    //party widgets (show only if this is for a party)
                    (attendableEventDialogData.attendableEventInfo.isParty)
                        ? partyWidgets(
                            ref,
                            viewModelProvider,
                            attendableEventDialogData,
                          )
                        : const SizedBox(),

                    //attend with
                    const DialogLabelText(
                        text: AttendableEventDialogsTextConstants.attendPrompt),
                    attendWithDropdown(
                      ref,
                      viewModelProvider,
                      attendableEventDialogData
                          .attendEventDetail.attendWithPartner,
                      attendableEventDialogData
                          .attendableEventInfo.attendWithOptions,
                    ),

                    const AddVerticalSpace(
                      height: DialogConstants.verticalDescriptionButtonSpacing,
                    ),

                    //buttons
                    DefaultElevatedButton(
                      text: TextConstants.attend,
                      onPressed: () {
                        AutoRouter.of(context).popForced();
                        //ATTEND EVENT
                        ref.read(viewModelProvider.notifier).attendEvent();
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
    AttendableEventDialogViewModelProvider viewModelProvider,
    AttendableEventDialogData attendableEventDialogData,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //activity
        const DialogLabelText(
          text: AttendableEventDialogsTextConstants.partyActivityPrompt,
        ),
        partyActivityDropdown(
          ref,
          viewModelProvider,
          attendableEventDialogData.attendEventDetail.partyEventActivity,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),

        //gift
        const DialogLabelText(
            text: AttendableEventDialogsTextConstants.giftItemPrompt),
        bringGiftDropDown(
          ref,
          viewModelProvider,
          attendableEventDialogData.attendEventDetail.itemGift,
          attendableEventDialogData.attendableEventInfo.giftOptionsInStorage,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),

        //money gift
        DialogLabelText(
            text:
                "${AttendableEventDialogsTextConstants.moneyGiftPrompt} ${attendableEventDialogData.formattedMoneyGift}"),
        moneyGiftSlider(
          ref,
          viewModelProvider,
          attendableEventDialogData.attendEventDetail.moneyGift,
          attendableEventDialogData.attendableEventInfo.maxPlayerMoney,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
      ],
    );
  }

  DialogDropdown bringGiftDropDown(
    WidgetRef ref,
    AttendableEventDialogViewModelProvider viewModelProvider,
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
      onChanged: (value) =>
          ref.read(viewModelProvider.notifier).updateItemGift(value),
    );
  }

  Widget eventLeaveTimeCounter(
    WidgetRef ref,
    AttendableEventDialogViewModelProvider viewModelProvider,
    int chosenLeaveTimeInMinutes,
  ) {
    return EditableQuantity(
      text: getClockTime(timeInMinutes: chosenLeaveTimeInMinutes),
      onIncrease: ref.read(viewModelProvider.notifier).increaseExitTime,
      onDecrease: ref.read(viewModelProvider.notifier).decreaseExitTime,
    );
  }

  DialogDropdown partyActivityDropdown(
    WidgetRef ref,
    AttendableEventDialogViewModelProvider viewModelProvider,
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
          ref.read(viewModelProvider.notifier).updatePartyEventActivity(value!),
    );
  }

  DialogDropdown attendWithDropdown(
    WidgetRef ref,
    AttendableEventDialogViewModelProvider viewModelProvider,
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
      onChanged: (value) =>
          ref.read(viewModelProvider.notifier).updateAttendWithPartner(value!),
    );
  }

  DialogSlider moneyGiftSlider(
    WidgetRef ref,
    AttendableEventDialogViewModelProvider viewModelProvider,
    double chosenMoneyGift,
    int maxPlayerMoney,
  ) {
    return DialogSlider(
      value: chosenMoneyGift,
      max: maxPlayerMoney.toDouble(),
      onChanged: (value) =>
          ref.read(viewModelProvider.notifier).updateMoneyGift(
                value.roundToDouble(),
              ),
    );
  }
}
