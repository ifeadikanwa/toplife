import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

IconButton appIconButton({
  required bool smallIconButton,
  required Icon icon,
  required Function() onPressed,
}) {
  return IconButton(
    visualDensity: const VisualDensity(
      horizontal: VisualDensity.minimumDensity,
      vertical: VisualDensity.minimumDensity,
    ),
    iconSize: (smallIconButton) ? smallIconButtonSize : defaultIconButtonSize,
    onPressed: onPressed,
    icon: icon,
  );
}
