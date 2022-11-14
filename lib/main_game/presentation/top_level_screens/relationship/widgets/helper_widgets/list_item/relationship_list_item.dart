import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/case/list_view_item_case.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_avatar.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_label_and_name.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/relationship_bar.dart';

class RelationshipListItem extends StatelessWidget {
  final String avatarImagePath;
  final String relationshipLabel;
  final String name;
  final int relationshipAmount;
  final void Function() onTap;

  const RelationshipListItem({
    Key? key,
    required this.avatarImagePath,
    required this.relationshipLabel,
    required this.name,
    required this.relationshipAmount,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListViewItemCase(
      content: Row(
        children: [
          RelationshipAvatar(avatarImagePath: avatarImagePath),
          const AddHorizontalSpace(width: listRowItemsSpacing),
          relationshipInfo(),
        ],
      ),
      onTap: onTap,
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
