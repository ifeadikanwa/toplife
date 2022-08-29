import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class ActionText extends StatelessWidget {
  final String actionTitle;
  final String actionDescription;

  const ActionText(
      {Key? key, required this.actionTitle, required this.actionDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            actionTitle,
            style: primaryTextStyle,
          ),
        ),
        const AddVerticalSpace(height: 4.0),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            actionDescription,
            style: secondaryTextStyle,
          ),
        ),
      ],
    );
  }
}
