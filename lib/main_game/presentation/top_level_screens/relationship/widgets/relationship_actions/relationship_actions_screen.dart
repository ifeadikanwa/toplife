import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/inner_level_screen.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/section_header.dart';
import 'package:toplife/core/common_widgets/list_templates/interaction_list_item.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_actions/helper_widgets/relationship_info_card_widget.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_actions/relationship_actions_screen_view_model.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';

//view model data is list of interactions
class RelationshipActionsScreen extends ConsumerWidget {
  final PersonRelationshipPair personRelationshipPair;

  const RelationshipActionsScreen({
    super.key,
    required this.personRelationshipPair,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final relationshipActionsScreenViewModelDataProvider = ref.watch(
        relationshipActionsScreenViewModelProvider(personRelationshipPair));

    return relationshipActionsScreenViewModelDataProvider.when(
      data: (relationshipInteractions) {
        //get the view model class
        final RelationshipActionsScreenViewModel
            relationshipActionsScreenViewModel = ref.watch(
                relationshipActionsScreenViewModelProvider(
                        personRelationshipPair)
                    .notifier);

        //widget
        return InnerLevelScreen(
          title:
              relationshipActionsScreenViewModel.getCurrentRelationshipLabel(),
          child: Expanded(
            child: ScreenContent(
              content: ListView.separated(
                itemCount: relationshipInteractions.length,
                itemBuilder: (context, index) {
                  //interaction
                  final RelationshipInteraction relationshipInteraction =
                      relationshipInteractions[index];
                  //person
                  // final Person relationshipPerson = relationshipActionsScreenViewModel.relationshipPair.person;

                  //Add person info, section header, and list item
                  if (index == 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RelationshipInfoCardWidget(
                          firstName:
                              relationshipActionsScreenViewModel.getFirstName(),
                          lastName:
                              relationshipActionsScreenViewModel.getLastName(),
                          age: relationshipActionsScreenViewModel.getAge(),
                          relationshipLevel: relationshipActionsScreenViewModel
                              .getRelationshipLevel(),
                          romanticRelationshipLength:
                              relationshipActionsScreenViewModel
                                  .getRomanticRelationshipDuration(),
                          previousRelationshipLabel:
                              relationshipActionsScreenViewModel
                                  .getPrevRelationshipLabel(),
                          showInfoButton: relationshipActionsScreenViewModel
                              .showInfoButton(),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: listHeaderPadding),
                          child: SectionHeader(
                            sectionTitle: TextConstants.interactions,
                          ),
                        ),
                        InteractionListItem(
                          interactionTitle: relationshipInteraction.title,
                          interactionDescription:
                              relationshipInteraction.description,
                          timeInMinutes:
                              relationshipInteraction.durationInMinutes,
                          onTap: () async {
                            await relationshipActionsScreenViewModel
                                .executeInteraction(
                              relationshipInteraction: relationshipInteraction,
                              context: context,
                            );
                          },
                        ),
                      ],
                    );
                  }
                  //just add list item
                  else {
                    return InteractionListItem(
                      interactionTitle: relationshipInteraction.title,
                      interactionDescription:
                          relationshipInteraction.description,
                      timeInMinutes: relationshipInteraction.durationInMinutes,
                      onTap: () async {
                        await relationshipActionsScreenViewModel
                            .executeInteraction(
                          relationshipInteraction: relationshipInteraction,
                          context: context,
                        );
                      },
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
      },
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
