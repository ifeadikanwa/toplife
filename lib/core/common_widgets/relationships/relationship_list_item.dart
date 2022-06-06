import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/avatar/avatar_widget.dart';
import 'package:toplife/core/common_widgets/constants.dart';
import 'package:toplife/core/common_widgets/progress_bar/progress_bar.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';

class RelationshipListItem extends StatelessWidget {
  const RelationshipListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }

  Widget avatar() {
    return const Avatar(
      avatarSize: 40,
      imagePath: "assets/images/black_woman_placeholder.jpg",
    );
  }

  Widget relationshipInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          relationshipLabelAndName(),
          relationshipBar(),
        ],
      ),
    );
  }

  Widget relationshipLabelAndName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Wife",
          style: relationshipLabelTextStyle,
        ),
        Text(
          "Ifeadikanwa Eze",
          style: relationshipNameTextStyle,
        ),
      ],
    );
  }

  Widget relationshipBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: const [
          Text(
            "Relationships",
            style: largeStatsTextStyle,
          ),
          AddHorizontalSpace(width: 4.0),
          Expanded(
            child: ProgressBar(
              progressValue: 80,
              minHeight: smallMinHeight,
            ),
          ),
        ],
      ),
    );
  }
}
