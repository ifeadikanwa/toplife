import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/list_templates/case/general_list_item_case.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/action_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_systems/system_event/util/get_attendable_event_time.dart';
import 'package:toplife/main_systems/system_event/util/get_attendable_event_title.dart';
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
    final currentGame = ref.watch(currentGameProvider).valueOrNull;

    return GeneralListItemCase(
      hasDivider: true,
      content: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ActionText(
                actionTitle: getAttendableEventTitle(
                  eventMainPerson: eventMainPerson,
                  event: event,
                ),
                actionDescription: getAttendableEventTime(
                  event: event,
                ),
                disabled: (eventCanStillBeAttended) ? false : true,
              ),
            ),
            OutlinedButton(
              onPressed: (!eventIsOpen || !eventCanStillBeAttended)
                  ? null //disable button
                  : () async {
                      if (currentGame != null) {
                        ref.read(eventManagerProvider).runEvent(
                              currentGame.currentPlayerID,
                              event,
                              context,
                            );
                      }
                    },
              child: const Text(TextConstants.attend),
            ),
          ],
        ),
      ],
    );
  }
}
