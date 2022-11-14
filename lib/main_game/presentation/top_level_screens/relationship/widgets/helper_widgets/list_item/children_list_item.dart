import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/case/list_view_item_case.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_avatar.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_label_and_name.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/relationship_bar.dart';

class ChildrenListItem extends StatelessWidget {
  final String avatarImagePath;
  final String relationshipLabel;
  final String name;
  final int relationshipAmount;
  final bool inYourCustody;
  final void Function() onTap;

  const ChildrenListItem({
    Key? key,
    required this.avatarImagePath,
    required this.relationshipLabel,
    required this.name,
    required this.relationshipAmount,
    required this.inYourCustody,
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
          const AddHorizontalSpace(width: listRowItemsSpacing * 2),
          inYourCustody
              ? const Center(
                  child: Icon(
                    Icons.home_outlined,
                    // color: Colors.grey,
                    size: childrenListHomeIconSize,
                  ),
                )
              : const AddHorizontalSpace(
                  width: childrenListHomeIconSize,
                ),
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
