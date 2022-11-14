import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/list_templates/section.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/helper_widgets/list_item/event_list_item.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_person_pair.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';

class EventSection extends ConsumerWidget {
  final List<EventPersonPair> eventPersonPairs;
  const EventSection({
    Key? key,
    required this.eventPersonPairs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentGame = ref.watch(currentGameProvider).valueOrNull;
    final travelTime = ref.watch(travelTimeProvider).valueOrNull;

    return Section(
      sectionTitle: TextConstants.events,
      sectionItems: [
        ...eventPersonPairs
            .map(
              (eventPersonPair) => EventListItem(
                eventMainPerson: eventPersonPair.person,
                event: eventPersonPair.event,
                eventIsOpen: (currentGame != null && travelTime != null)
                    ? EventManager.checkIfEventIsOpen(
                        startTime: eventPersonPair.event.startTime!,
                        endTime: eventPersonPair.event.endTime!,
                        travelTime: travelTime,
                        currentTime: currentGame.currentTimeInMinutes,
                      )
                    : false,
                eventCanStillBeAttended:
                    (currentGame != null && travelTime != null)
                        ? EventManager.checkIfEventCanStillBeAttended(
                            startTime: eventPersonPair.event.startTime!,
                            endTime: eventPersonPair.event.endTime!,
                            travelTime: travelTime,
                            currentTime: currentGame.currentTimeInMinutes,
                          )
                        : false,
              ),
            )
            .toList(),
      ],
    );
  }
}
