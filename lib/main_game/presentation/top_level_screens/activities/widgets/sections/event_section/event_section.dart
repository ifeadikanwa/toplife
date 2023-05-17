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
    final eventItemsProvider = ref.watch(eventSectionViewModelProvider);

    return eventItemsProvider.when(
      data: (eventItems) {
        return Section(
          sectionTitle: TextConstants.events,
          sectionItems: (eventItems.isEmpty)
              ? [
                  const NoEventListItem(),
                ]
              : [
                  ...eventItems
                      .map(
                        (eventItem) => EventListItem(
                          eventMainPerson: eventItem.eventPersonPair.person,
                          event: eventItem.eventPersonPair.event,
                          eventIsOpen: eventItem.eventIsOpen,
                          eventCanStillBeAttended:
                              eventItem.eventCanStillBeAttended,
                        ),
                      )
                      .toList(),
                ],
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => const NoEventListItem(),
    );
  }
}
