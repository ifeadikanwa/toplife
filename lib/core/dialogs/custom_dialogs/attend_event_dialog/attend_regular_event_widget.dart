import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_event_choices_to_buttons.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

final regularEventStayDurationProvider =
    StateProvider.autoDispose<EventStayDuration>(
        (ref) => EventStayDuration.tillTheEnd);

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
        ref.watch(regularEventStayDurationProvider);

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
        const DialogDropdownLabelText(text: DialogConstants.stayDurationPrompt),
        stayDurationDropdown(ref),
        const AddVerticalSpace(
          height: DialogConstants.verticalDescriptionButtonSpacing,
        ),
        (hasActivePartner)
            ? DialogEventChoicesToWidgets(
                eventChoices: [
                  EventChoice(
                    choiceDescription: "Attend alone",
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
                    choiceDescription: "Attend with partner",
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
                    choiceDescription: "Attend",
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

  DialogDropdown stayDurationDropdown(WidgetRef ref) {
    return DialogDropdown<EventStayDuration>(
      value: ref.watch(regularEventStayDurationProvider),
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
          ref.read(regularEventStayDurationProvider.notifier).state = value!,
    );
  }
}
