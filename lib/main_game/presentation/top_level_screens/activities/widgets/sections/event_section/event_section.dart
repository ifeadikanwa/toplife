import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/list_templates/section.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/helper_widgets/list_item/event_list_item/event_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/helper_widgets/list_item/no_event_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/sections/event_section/event_section_view_model.dart';

class EventSection extends ConsumerWidget {
  const EventSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventSectionViewModel =
        ref.watch(eventSectionViewModelProvider.notifier);
    final eventPersonPairsProvider = ref.watch(eventSectionViewModelProvider);

    return eventPersonPairsProvider.when(
      data: (eventPersonPairs) {
        return Section(
          sectionTitle: TextConstants.events,
          sectionItems: (eventPersonPairs.isEmpty)
              ? [
                  const NoEventListItem(),
                ]
              : [
                  ...eventPersonPairs
                      .map(
                        (eventPersonPair) => EventListItem(
                          eventMainPerson: eventPersonPair.person,
                          event: eventPersonPair.event,
                          eventIsOpen: eventSectionViewModel
                              .checkIfEventIsOpen(eventPersonPair.event),
                          eventCanStillBeAttended: eventSectionViewModel
                              .checkIfEventCanStillBeAttended(
                                  eventPersonPair.event),
                        ),
                      )
                      .toList(),
                ],
        );
      },
      error: (error, stackTrace) => const NoEventListItem(),
      loading: () => Container(),
    );
  }
}
