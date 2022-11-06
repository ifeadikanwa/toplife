import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/section.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/helper_widgets/list_item/event_list_item.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_person_pair.dart';

class EventSection extends StatelessWidget {
  final List<EventPersonPair> eventPersonPairs;
  const EventSection({
    Key? key,
    required this.eventPersonPairs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      sectionTitle: TextConstants.events,
      sectionItems: [
        ...eventPersonPairs
            .map(
              (eventPersonPair) => EventListItem(
                eventMainPerson: eventPersonPair.person,
                event: eventPersonPair.event,
              ),
            )
            .toList(),
      ],
    );
  }
}
