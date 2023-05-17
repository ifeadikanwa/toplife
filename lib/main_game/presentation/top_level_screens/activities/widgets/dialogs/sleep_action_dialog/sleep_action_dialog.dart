import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_button.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/utils/date_and_time/convert_minutes_to_truncated_hours.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/constants/activities_dialog_text.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/dialogs/sleep_action_dialog/sleep_action_dialog_view_model.dart';
import 'package:toplife/main_systems/system_person/constants/stats_constants.dart';

class SleepActionDialog extends ConsumerWidget {
  final Game currentGame;

  const SleepActionDialog({
    super.key,
    required this.currentGame,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SleepActionDialogViewModel sleepActionDialogViewModel =
        ref.watch(sleepActionDialogViewModelProvider.notifier);

    final Time chosenTime = ref.watch(sleepActionDialogViewModelProvider);

    return DialogContainer(
      title: const DialogTitleText(text: ActivitiesDialogText.restTime),
      children: [
        const DialogBodyText(text: ActivitiesDialogText.sleepTimePrompt),
        const AddVerticalSpace(
          height: DialogConstants.verticalTextTextSpacing,
        ),
        const DialogDropdownLabelText(text: ActivitiesDialogText.hoursPrompt),
        hourDurationDropdown(
          sleepActionDialogViewModel,
          chosenTime.hours,
        ),
        const DialogDropdownLabelText(text: ActivitiesDialogText.minutesPrompt),
        minutesDurationDropdown(
          sleepActionDialogViewModel,
          chosenTime.minutes,
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalDescriptionButtonSpacing,
        ),
        DialogButton(
          buttonDescription: ActivitiesDialogText.sleep,
          action: () async {
            await sleepActionDialogViewModel.sleep(
              context: context,
              currentGame: currentGame,
            );
          },
        )
      ],
    );
  }

  DialogDropdown hourDurationDropdown(
    SleepActionDialogViewModel sleepActionDialogViewModel,
    int chosenHourDuration,
  ) {
    return DialogDropdown<int>(
      value: (chosenHourDuration * Time.minutesInAnHour),
      items: StatsConstants.possibleSleepHoursInMinutes
          .map(
            (sleepHourInMinutes) => DropdownMenuItem(
              value: sleepHourInMinutes,
              child: DialogBodyText(
                text: "${convertMinutesToTruncatedHours(sleepHourInMinutes)}",
              ),
            ),
          )
          .toList(),
      onChanged: (value) => sleepActionDialogViewModel.updateHours(value!),
    );
  }
}

DialogDropdown minutesDurationDropdown(
  SleepActionDialogViewModel sleepActionDialogViewModel,
  int chosenMinutesDuration,
) {
  return DialogDropdown<int>(
    value: chosenMinutesDuration,
    items: StatsConstants.possibleSleepMinutesInMinutes
        .map(
          (sleepMinutes) => DropdownMenuItem(
            value: sleepMinutes,
            child: DialogBodyText(
              text: "$sleepMinutes",
            ),
          ),
        )
        .toList(),
    onChanged: (value) => sleepActionDialogViewModel.updateMinutes(value!),
  );
}
