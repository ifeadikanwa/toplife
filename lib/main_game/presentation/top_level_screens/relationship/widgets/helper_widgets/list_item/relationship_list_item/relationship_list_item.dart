import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/list_templates/case/list_view_item_case.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_avatar.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_label_and_name.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item/relationship_list_item_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/relationship_bar.dart';

class RelationshipListItem extends ConsumerWidget {
  final String avatarImagePath;
  final String relationshipLabel;
  final int personID;
  final String name;
  final int relationshipAmount;
  final void Function() onTap;

  const RelationshipListItem({
    Key? key,
    required this.avatarImagePath,
    required this.relationshipLabel,
    required this.personID,
    required this.name,
    required this.relationshipAmount,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    //watch the viewModel that provides a list of personIDs for people currently in the players home
    final relationshipListItemViewModel =
        ref.watch(relationshipListItemViewModelProvider);

    return relationshipListItemViewModel.when(
      data: (personIdsOfPeopleInPlayersHome) {
        //check if they are currently living together
        final currentlyLivingTogether =
            personIdsOfPeopleInPlayersHome.contains(personID);

        //Widget
        return ListViewItemCase(
          content: Row(
            children: [
              RelationshipAvatar(avatarImagePath: avatarImagePath),
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
          onTap: onTap,
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
            relationshipLabel: relationshipLabel,
            name: name,
          ),
          RelationshipBar(
            relationshipAmount: relationshipAmount,
          ),
        ],
      ),
    );
  }
}
