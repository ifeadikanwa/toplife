import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/config/routing/app_router.gr.dart';
import 'package:toplife/core/common_states/watch/home/ids_of_current_people_in_players_home_provider.dart';
import 'package:toplife/core/common_widgets/list_templates/case/list_view_item_case.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/relationship_label_and_name.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/relationship_bar.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/label/get_platonic_and_romantic_relationship_label_from_string.dart.dart';

class RelationshipListItem extends ConsumerWidget {
  final PersonRelationshipPair personRelationshipPair;

  const RelationshipListItem({
    super.key,
    required this.personRelationshipPair,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    //watch a list of personIDs for people currently in the players home
    final personIdsOfPeopleInPlayersHomeProvider =
        ref.watch(idsOfCurrentPeopleInPlayersHomeProvider);

    return personIdsOfPeopleInPlayersHomeProvider.when(
      data: (personIdsOfPeopleInPlayersHome) {
        //check if they are currently living together
        final currentlyLivingTogether = personIdsOfPeopleInPlayersHome.contains(
          personRelationshipPair.person.id,
        );

        //Widget
        return ListViewItemCase(
          content: Row(
            children: [
              // const RelationshipAvatar(avatarImagePath: ""),
              const AddHorizontalSpace(width: listRowItemsSpacing),
              relationshipInfo(),
              const AddHorizontalSpace(width: listRowItemsSpacing * 2),
              currentlyLivingTogether
                  ? const Center(
                      child: Icon(
                        Icons.home_outlined,
                        // color: Colors.grey,
                        size: relationshipListHomeIconSize,
                      ),
                    )
                  : const AddHorizontalSpace(
                      width: relationshipListHomeIconSize,
                    ),
            ],
          ),
          onTap: () {
            AutoRouter.of(context).push(
              RelationshipActionsRoute(
                  personRelationshipPair: personRelationshipPair),
            );
          },
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }

  Widget relationshipInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RelationshipLabelAndName(
            relationshipLabel:
                getPlatonicAndRomanticRelationshipLabelFromString(
              genderString: personRelationshipPair.person.gender,
              platonicRelationshipTypeString:
                  personRelationshipPair.relationship.platonicRelationshipType,
              romanticRelationshipTypeString:
                  personRelationshipPair.relationship.romanticRelationshipType,
              previousFamilialRelationshipString: personRelationshipPair
                  .relationship.previousFamilialRelationship,
              isCoParent: personRelationshipPair.relationship.isCoParent,
              activeRomance: personRelationshipPair.relationship.activeRomance,
              toLowerCase: false,
              spacedRelationshipLabelSeparator: true,
            ),
            name: getFullNameString(
              firstName: personRelationshipPair.person.firstName,
              lastName: personRelationshipPair.person.lastName,
            ),
          ),
          RelationshipBar(
            relationshipAmount: personRelationshipPair.relationship.level,
          ),
        ],
      ),
    );
  }
}
