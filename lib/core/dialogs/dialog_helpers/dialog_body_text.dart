import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';

class DialogBodyText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const DialogBodyText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? DialogConstants.defaultBodyTextStyle,
      textAlign: TextAlign.center,
      softWrap: true,
      
    );
  }
}
