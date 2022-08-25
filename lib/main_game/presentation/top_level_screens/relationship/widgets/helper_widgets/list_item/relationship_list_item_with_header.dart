import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/text_templates/section_header.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';

class RelationshipListItemWithHeader extends StatelessWidget {
  final String sectionTitle;
  final String avatarImagePath;
  final String relationshipLabel;
  final String name;
  final int relationshipAmount;
  const RelationshipListItemWithHeader(
      {Key? key,
      required this.sectionTitle,
      required this.avatarImagePath,
      required this.relationshipLabel,
      required this.name,
      required this.relationshipAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddVerticalSpace(height: listHeaderPadding),
        SectionHeader(sectionTitle: sectionTitle),
        const AddVerticalSpace(height: listHeaderPadding),
        RelationshipListItem(
            avatarImagePath: avatarImagePath,
            relationshipLabel: relationshipLabel,
            name: name,
            relationshipAmount: relationshipAmount)
      ],
    );
  }
}
