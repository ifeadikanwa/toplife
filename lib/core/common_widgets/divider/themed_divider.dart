import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class ThemedDivider extends StatelessWidget {
  final double thickness;
  const ThemedDivider({
    super.key,
    this.thickness = defaultDividerHeight,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return Divider(
      thickness: thickness,
      color: (appTheme.brightness == Brightness.light)
          ? Colors.black
          : Colors.white,
    );
  }
}
