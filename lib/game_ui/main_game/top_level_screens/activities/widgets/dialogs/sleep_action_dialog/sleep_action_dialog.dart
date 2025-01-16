import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/button/default_elevated_button.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/utils/date_and_time/convert_minutes_to_truncated_hours.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/activities/constants/activities_dialog_text.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/activities/widgets/dialogs/sleep_action_dialog/sleep_action_dialog_view_model.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/stats_constants.dart';

class SleepActionDialog extends ConsumerWidget {
  const SleepActionDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SleepActionDialogData sleepActionDialogData =
        ref.watch(sleepActionDialogViewModelProvider);

    return DialogContainer(
      title: const DialogTitleText(text: ActivitiesDialogText.restTime),
      children: [
        const DialogBodyText(text: ActivitiesDialogText.sleepTimePrompt),
        const AddVerticalSpace(
          height: DialogConstants.verticalTextTextSpacing,
        ),
        const DialogLabelText(text: ActivitiesDialogText.hoursPrompt),
        hourDurationDropdown(
          sleepActionDialogData.hours,
          ref,
        ),
        const DialogLabelText(text: ActivitiesDialogText.minutesPrompt),
        minutesDurationDropdown(
          sleepActionDialogData.minutes,
          ref,
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalDescriptionButtonSpacing,
        ),
        DefaultElevatedButton(
          onPressed: () async {
            AutoRouter.of(context).popForced();
            await ref.read(sleepActionDialogViewModelProvider.notifier).sleep();
          },
          text: ActivitiesDialogText.sleep,
        ),
      ],
    );
  }

  DialogDropdown hourDurationDropdown(
    int chosenHourDuration,
    WidgetRef ref,
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
      onChanged: (value) => ref
          .read(sleepActionDialogViewModelProvider.notifier)
          .updateHours(value!),
    );
  }
}

DialogDropdown minutesDurationDropdown(
  int chosenMinutesDuration,
  WidgetRef ref,
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
    onChanged: (value) => ref
        .read(sleepActionDialogViewModelProvider.notifier)
        .updateMinutes(value!),
  );
}
