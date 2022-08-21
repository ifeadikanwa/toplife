import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_avatar.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_label_and_name.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item_case.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/relationship_bar.dart';

class RelationshipListItem extends StatelessWidget {
  final String avatarImagePath;
  final String relationshipLabel;
  final String name;
  final int relationshipAmount;
  const RelationshipListItem({
    Key? key,
    required this.avatarImagePath,
    required this.relationshipLabel,
    required this.name,
    required this.relationshipAmount,
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
          RelationshipBar(
            relationshipAmount: relationshipAmount,
          ),
        ],
      ),
    );
  }
}
