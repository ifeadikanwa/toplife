import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class WorkListItem extends StatelessWidget {
  final String actionTitle;
  final String actionDescription;
  final bool hasDivider;

  const WorkListItem({
    Key? key,
    required this.actionTitle,
    required this.actionDescription,
    this.hasDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: listVerticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            actionTitle,
            style: primaryTextStyle,
          ),
          const AddVerticalSpace(height: 4.0),
          Text(
            actionDescription,
            style: secondaryTextStyle,
          ),
          const AddVerticalSpace(height: listVerticalPadding),
          hasDivider ? const ListDivider() : const SizedBox(),
        ],
      ),
    );
  }
}
