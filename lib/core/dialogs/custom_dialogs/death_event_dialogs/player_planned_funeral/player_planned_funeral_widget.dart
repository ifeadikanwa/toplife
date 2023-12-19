import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/custom_dialogs/death_event_dialogs/death_event_dialogs_text_constants.dart';
import 'package:toplife/core/dialogs/custom_dialogs/death_event_dialogs/player_planned_funeral/player_planned_funeral_dialog_view_model.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/main_systems/system_event/constants/funeral_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/funeral_event_detail.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/get_in_x_days_string.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';

class PlayerPlannedFuneralWidget extends ConsumerWidget {
  final String firstPersonEventDescription;
  final Country playerCountry;

  const PlayerPlannedFuneralWidget({
    Key? key,
    required this.firstPersonEventDescription,
    required this.playerCountry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FuneralEventDetail funeralEventDetail =
        ref.watch(playerPlannedFuneralDialogViewModelProvider);
    final PlayerPlannedFuneralDialogViewModel plannedFuneralDialogViewModel =
        ref.watch(playerPlannedFuneralDialogViewModelProvider.notifier);

    return DialogContainer(
      title: const DialogTitleText(
          text: DeathEventDialogsTextConstants.funeralPlanEventTitle),
      children: [
        DialogBodyText(
          text: SentenceUtil.convertFromFirstPersonToSecondPerson(
            firstPersonSentence: firstPersonEventDescription,
          ),
        ),

        //plan
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
        const DialogDropdownLabelText(
            text: DeathEventDialogsTextConstants.funeralPlanPrompt),
        funeralTypeDropDown(
          plannedFuneralDialogViewModel,
          funeralEventDetail.funeralType,
        ),

        //event day from current day
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
        const DialogDropdownLabelText(
            text: DeathEventDialogsTextConstants.funeralDayPrompt),
        eventDaysLaterDropDown(
          plannedFuneralDialogViewModel,
          funeralEventDetail.funeralChosenDaysFromCurrentDay,
        ),

        //event start time
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
        const DialogDropdownLabelText(
            text: DeathEventDialogsTextConstants.funeralStartTimePrompt),
        eventStartTimeDropDown(
          plannedFuneralDialogViewModel,
          funeralEventDetail.funeralStartTime,
        ),

        //cost
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
        DialogBodyText(
          text:
              "Total Cost: ${playerCountry.currency}${getCountryEconomyAdjustedPrice(country: playerCountry.name, basePrice: funeralEventDetail.funeralType.basePrice)}",
        ),

        //call to action
        const AddVerticalSpace(
          height: DialogConstants.verticalDescriptionButtonSpacing,
        ),
        ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).popForced(funeralEventDetail);
            },
            child: const Text(
                DeathEventDialogsTextConstants.funeralPlanCallToAction)),
      ],
    );
  }

  DialogDropdown funeralTypeDropDown(
    PlayerPlannedFuneralDialogViewModel playerPlannedFuneralDialogViewModel,
    FuneralType chosenFuneralType,
  ) {
    return DialogDropdown<FuneralType>(
      value: chosenFuneralType,
      items: FuneralType.values
          .map((funeralTypeEnum) => DropdownMenuItem<FuneralType>(
                value: funeralTypeEnum,
                child: DialogBodyText(text: funeralTypeEnum.name),
              ))
          .toList(),
      onChanged: (value) {
        playerPlannedFuneralDialogViewModel.updateFuneralType(value!);
      },
    );
  }

  DialogDropdown eventDaysLaterDropDown(
    PlayerPlannedFuneralDialogViewModel playerPlannedFuneralDialogViewModel,
    int chosenDaysFromCurrentDay,
  ) {
    return DialogDropdown<int>(
      value: chosenDaysFromCurrentDay,
      items: FuneralEventDetail.possibleFuneralDaysFromCurrentDay
          .map((daysFromCurrentDay) => DropdownMenuItem<int>(
                value: daysFromCurrentDay,
                child: DialogBodyText(
                  text: getInXDaysString(daysFromCurrentDay),
                ),
              ))
          .toList(),
      onChanged: (value) {
        playerPlannedFuneralDialogViewModel
            .updateFuneralChosenDaysFromCurrentDay(value!);
      },
    );
  }

  DialogDropdown eventStartTimeDropDown(
    PlayerPlannedFuneralDialogViewModel playerPlannedFuneralDialogViewModel,
    int chosenStartTime,
  ) {
    return DialogDropdown<int>(
      value: chosenStartTime,
      items: FuneralEventDetail.possibleFuneralStartTimes
          .map((startTimeInMinutes) => DropdownMenuItem<int>(
                value: startTimeInMinutes,
                child: DialogBodyText(
                    text: getClockTime(timeInMinutes: startTimeInMinutes)),
              ))
          .toList(),
      onChanged: (value) {
        playerPlannedFuneralDialogViewModel.updateFuneralStartTime(value!);
      },
    );
  }
}
