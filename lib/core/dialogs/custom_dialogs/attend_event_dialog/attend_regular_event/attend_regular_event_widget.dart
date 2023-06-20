import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/custom_dialogs/attend_event_dialog/attend_event_dialogs_text_constants.dart';
import 'package:toplife/core/dialogs/custom_dialogs/attend_event_dialog/attend_regular_event/attend_regular_event_dialog_view_model.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_event_choices_to_buttons.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class AttendRegularEventWidget extends ConsumerWidget {
  final int mainPlayerID;
  final Event event;
  final Person eventMainPerson;
  final String relationshipLabel;
  final String eventTitle;
  final String eventDescription;
  final bool hasActivePartner;
  final Future<void> Function({
    required BuildContext context,
    required Event event,
    required int mainPlayerID,
    required Person eventMainPerson,
    required String relationshipLabel,
    required EventStayDuration eventStayDuration,
  }) attendAlone;
  final Future<void> Function({
    required BuildContext context,
    required Event event,
    required int mainPlayerID,
    required Person eventMainPerson,
    required String relationshipLabel,
    required EventStayDuration eventStayDuration,
  }) attendWithPartner;

  const AttendRegularEventWidget({
    Key? key,
    required this.mainPlayerID,
    required this.event,
    required this.eventMainPerson,
    required this.relationshipLabel,
    required this.eventTitle,
    required this.eventDescription,
    required this.hasActivePartner,
    required this.attendAlone,
    required this.attendWithPartner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EventStayDuration eventStayDuration =
        ref.watch(attendRegularEventDialogViewModelProvider);
    final AttendRegularEventDialogViewModel attendRegularEventDialogViewModel =
        ref.watch(attendRegularEventDialogViewModelProvider.notifier);

    return DialogContainer(
      closeable: true,
      title: DialogTitleText(
        text: eventTitle,
      ),
      children: [
        DialogBodyText(
          text: eventDescription,
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalDropdownSpacing,
        ),
        const DialogDropdownLabelText(
            text: AttendEventDialogsTextConstants.stayDurationPrompt),
        stayDurationDropdown(
          attendRegularEventDialogViewModel,
          eventStayDuration,
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalDescriptionButtonSpacing,
        ),
        (hasActivePartner)
            ? DialogEventChoicesToWidgets(
                eventChoices: [
                  EventChoice(
                    choiceDescription: TextConstants.attendAlone,
                    choiceAction: (BuildContext context) async {
                      attendAlone(
                        context: context,
                        event: event,
                        mainPlayerID: mainPlayerID,
                        eventMainPerson: eventMainPerson,
                        relationshipLabel: relationshipLabel,
                        eventStayDuration: eventStayDuration,
                      );
                    },
                  ),
                  EventChoice(
                    choiceDescription: TextConstants.attendWithPartner,
                    choiceAction: (BuildContext context) async {
                      attendWithPartner(
                        context: context,
                        event: event,
                        mainPlayerID: mainPlayerID,
                        eventMainPerson: eventMainPerson,
                        relationshipLabel: relationshipLabel,
                        eventStayDuration: eventStayDuration,
                      );
                    },
                  ),
                ],
              )
            : DialogEventChoicesToWidgets(
                eventChoices: [
                  EventChoice(
                    choiceDescription: TextConstants.attend,
                    choiceAction: (BuildContext context) async {
                      attendAlone(
                        context: context,
                        event: event,
                        mainPlayerID: mainPlayerID,
                        eventMainPerson: eventMainPerson,
                        relationshipLabel: relationshipLabel,
                        eventStayDuration: eventStayDuration,
                      );
                    },
                  ),
                ],
              ),
      ],
    );
  }

  DialogDropdown stayDurationDropdown(
    AttendRegularEventDialogViewModel attendRegularEventDialogViewModel,
    EventStayDuration chosenEventStayDuration,
  ) {
    return DialogDropdown<EventStayDuration>(
      value: chosenEventStayDuration,
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
          attendRegularEventDialogViewModel.updateStayDuration(value!),
    );
  }
}
