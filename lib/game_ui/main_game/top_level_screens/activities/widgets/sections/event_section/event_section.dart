import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/list_templates/section.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/activities/widgets/helper_widgets/list_item/event_list_item/event_list_item.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/activities/widgets/helper_widgets/list_item/no_event_list_item.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/activities/widgets/sections/event_section/event_section_view_model.dart';

class EventSection extends ConsumerWidget {
  const EventSection({
    super.key,
  });

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
                  ...eventItems.map(
                    (eventItem) => EventListItem(eventItem: eventItem),
                  ),
                ],
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => const NoEventListItem(),
    );
  }
}
