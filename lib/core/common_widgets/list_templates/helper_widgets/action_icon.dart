import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class ActionIcon extends StatelessWidget {
  final IconData? icon;
  const ActionIcon({
    super.key,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (icon == null) ? const SizedBox() : Icon(icon),
        (icon == null)
            ? const SizedBox()
            : const AddHorizontalSpace(width: horizontalWidgetSpacing),
      ],
    );
  }
}
