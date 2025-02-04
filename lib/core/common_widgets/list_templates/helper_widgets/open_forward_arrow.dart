import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class OpenForwardArrow extends StatelessWidget {
  const OpenForwardArrow({super.key});

  @override
  Widget build(BuildContext context) {
    
    final appTheme = Theme.of(context);
    return Icon(
      Icons.play_arrow,
      color: appTheme.iconTheme.color?.withOpacity(0.5),
      size: listArrowIconSize,
    );
  }
}
