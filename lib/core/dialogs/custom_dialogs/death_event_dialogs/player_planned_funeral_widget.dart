import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/main_systems/system_event/constants/funeral_type.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/event_util.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';

final funeralTypeProvider = StateProvider.autoDispose<FuneralType>(
  (ref) => FuneralType.Burial,
);

final eventStartTimeProvider = StateProvider.autoDispose<int>(
  (ref) => _possibleFuneralStartTimes.first,
);

final List<int> _possibleFuneralStartTimes = [
  ...EventUtil.morningEventStartTimes,
  ...EventUtil.afternoonEventStartTimes,
];

class PlayerPlannedFuneralWidget extends ConsumerWidget {
  final int mainPlayerID;
  final Event deathEvent;
  final String firstPersonEventDescription;
  final Country playerCountry;

  final void Function({
    required BuildContext context,
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required Country playerCountry,
    required FuneralType funeralType,
    required int cost,
    required int eventStartTime,
  }) planFuneral;

  const PlayerPlannedFuneralWidget({
    Key? key,
    required this.mainPlayerID,
    required this.deathEvent,
    required this.firstPersonEventDescription,
    required this.playerCountry,
    required this.planFuneral,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FuneralType funeralType = ref.watch(funeralTypeProvider);
    final int cost = ref.watch(funeralTypeProvider).basePrice;
    final int eventStartTime = ref.watch(eventStartTimeProvider);

    return DialogContainer(
      title: const DialogTitleText(text: DialogConstants.funeralPlanEventTitle),
      children: [
        DialogBodyText(
          text: SentenceUtil.convertFromFirstPersonToSecondPerson(
            firstPersonSentence: firstPersonEventDescription,
          ),
        ),

        //plan
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
        const DialogDropdownLabelText(text: DialogConstants.funeralPlanPrompt),
        funeralTypeDropDown(ref),

        //event start time
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
        const DialogDropdownLabelText(
            text: DialogConstants.funeralStartTimePrompt),
        eventStartTimeDropDown(ref),

        //cost
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
        DialogBodyText(
          text:
              "Total Cost: ${playerCountry.currency}${ref.watch(funeralTypeProvider).basePrice * playerCountry.economy}",
        ),

        //call to action
        const AddVerticalSpace(
          height: DialogConstants.verticalDescriptionButtonSpacing,
        ),
        ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).popForced();
              planFuneral(
                context: context,
                mainPlayerID: mainPlayerID,
                deathEvent: deathEvent,
                firstPersonEventDescription: firstPersonEventDescription,
                playerCountry: playerCountry,
                funeralType: funeralType,
                cost: cost,
                eventStartTime: eventStartTime,
              );
            },
            child: const Text(DialogConstants.funeralPlanCallToAction)),
      ],
    );
  }

  DialogDropdown funeralTypeDropDown(WidgetRef ref) {
    return DialogDropdown<FuneralType>(
      value: ref.watch(funeralTypeProvider),
      items: FuneralType.values
          .map((funeralTypeEnum) => DropdownMenuItem<FuneralType>(
                value: funeralTypeEnum,
                child: DialogBodyText(text: funeralTypeEnum.name),
              ))
          .toList(),
      onChanged: (value) {
        ref.read(funeralTypeProvider.notifier).state = value!;
      },
    );
  }

  DialogDropdown eventStartTimeDropDown(WidgetRef ref) {
    return DialogDropdown<int>(
      value: ref.watch(eventStartTimeProvider),
      items: _possibleFuneralStartTimes
          .map((startTimeInMinutes) => DropdownMenuItem<int>(
                value: startTimeInMinutes,
                child: DialogBodyText(
                    text: getClockTime(timeInMinutes: startTimeInMinutes)),
              ))
          .toList(),
      onChanged: (value) {
        ref.read(eventStartTimeProvider.notifier).state = value!;
      },
    );
  }
}
