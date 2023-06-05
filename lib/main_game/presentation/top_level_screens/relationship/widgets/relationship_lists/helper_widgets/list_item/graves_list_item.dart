import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/case/list_view_item_case.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/relationship_avatar.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/relationship_label_and_name.dart';

class GravesListItem extends StatelessWidget {
  final String avatarImagePath;
  final String relationshipLabel;
  final String name;
  final int dayOfDeath;
  final void Function() onTap;

  const GravesListItem({
    Key? key,
    required this.avatarImagePath,
    required this.relationshipLabel,
    required this.name,
    required this.dayOfDeath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListViewItemCase(
      onTap: onTap,
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
