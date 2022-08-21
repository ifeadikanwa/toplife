import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_avatar.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_label_and_name.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item_case.dart';

class GraveyardListItem extends StatelessWidget {
  final String avatarImagePath;
  final String relationshipLabel;
  final String name;
  final int dayOfDeath;
  const GraveyardListItem({
    Key? key,
    required this.avatarImagePath,
    required this.relationshipLabel,
    required this.name,
    required this.dayOfDeath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelationshipListItemCase(
      content: Row(
        children: [
          RelationshipAvatar(avatarImagePath: avatarImagePath),
          const AddHorizontalSpace(width: listRowItemsSpacing),
          relationshipInfo(),
        ],
      ),
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
          Text(
            "Died on day $dayOfDeath",
            style: statsTextStyle,
          ),
        ],
      ),
    );
  }
}
