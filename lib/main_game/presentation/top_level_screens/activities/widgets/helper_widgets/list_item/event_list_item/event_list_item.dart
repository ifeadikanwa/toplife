import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/list_templates/case/general_list_item_case.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/action_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/helper_widgets/list_item/event_list_item/event_list_item_view_model.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class EventListItem extends ConsumerWidget {
  final Person eventMainPerson;
  final Event event;
  final bool eventIsOpen;
  final bool eventCanStillBeAttended;

  const EventListItem({
    Key? key,
    required this.eventMainPerson,
    required this.event,
    required this.eventIsOpen,
    required this.eventCanStillBeAttended,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventListItemViewModel = ref.watch(eventListItemViewModelProvider);

    return GeneralListItemCase(
      hasDivider: true,
      content: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ActionText(
                actionTitle: eventListItemViewModel.getEventTitle(
                  eventMainPerson: eventMainPerson,
                  event: event,
                ),
                actionDescription: eventListItemViewModel.getEventTime(
                  event: event,
                ),
                anotherActionDescription:
                    eventListItemViewModel.getEventLocation(
                  eventMainPerson: eventMainPerson,
                ),
                disabled: (eventCanStillBeAttended) ? false : true,
              ),
            ),
            OutlinedButton(
              onPressed: eventListItemViewModel.checkIfEventButtonIsUnavailable(
                eventIsOpen: eventIsOpen,
                eventCanStillBeAttended: eventCanStillBeAttended,
              )
                  ? null //disable button
                  : () => eventListItemViewModel.attendEvent(event),
              child: const Text(TextConstants.attend),
            ),
          ],
        ),
      ],
    );
  }
}
