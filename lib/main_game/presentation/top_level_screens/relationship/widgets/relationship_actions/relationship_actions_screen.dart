import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/inner_level_screen.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/section_header.dart';
import 'package:toplife/core/common_widgets/list_templates/interaction_list_item.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_actions/helper_widgets/relationship_info_card_widget.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

//view model data is list of interactions
class RelationshipActionsScreen extends ConsumerWidget {
  final String relationshipLabel;
  final RelationshipPair relationshipPair;
  final Person player;
  final int relationship;
  final bool livingTogether;

  const RelationshipActionsScreen({
    super.key,
    required this.relationshipLabel,
    required this.relationshipPair,
    required this.player,
    required this.relationship,
    required this.livingTogether,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InnerLevelScreen(
      title: relationshipLabel,
      child: Expanded(
        child: ScreenContent(
          content: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RelationshipInfoCardWidget(
                      firstName: "Samuel",
                      lastName: "Jackson",
                      age: "Young Adult",
                      relationship: 45,
                      showInfoButton: true,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: listHeaderPadding),
                      child: SectionHeader(
                        sectionTitle: TextConstants.interactions,
                      ),
                    ),
                    InteractionListItem(
                      interactionTitle: "Chat",
                      interactionDescription:
                          "Have a conversation about any and every thing",
                      onTap: () {},
                    ),
                  ],
                );
              } else {
                return InteractionListItem(
                  interactionTitle: "Chat",
                  interactionDescription:
                      "Have a conversation about any and every thing",
                  onTap: () {},
                );
              }
            },
            separatorBuilder: (BuildContext context, int index) {
              return const ListDivider();
            },
          ),
        ),
      ),
    );
  }
}
