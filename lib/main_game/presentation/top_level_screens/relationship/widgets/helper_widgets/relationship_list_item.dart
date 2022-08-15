import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/avatar/avatar_widget.dart';
import 'package:toplife/core/common_widgets/constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: listVerticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AddVerticalSpace(height: 2.0),
          Row(
            children: [
              avatar(),
              const AddHorizontalSpace(width: 4.0),
              relationshipInfo(),
            ],
          ),
          const AddVerticalSpace(height: 2.0),
        ],
      ),
    );
  }

  Widget avatar() {
    return Avatar(
      avatarSize: 40,
      imagePath: avatarImagePath,
    );
  }

  Widget relationshipInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          relationshipLabelAndName(),
          RelationshipBar(
            relationshipAmount: relationshipAmount,
          ),
        ],
      ),
    );
  }

  Widget relationshipLabelAndName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          relationshipLabel,
          style: relationshipLabelTextStyle,
        ),
        Text(
          name,
          style: relationshipNameTextStyle,
        ),
      ],
    );
  }
}
