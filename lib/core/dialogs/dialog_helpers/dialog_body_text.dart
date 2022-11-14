import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';

class DialogBodyText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const DialogBodyText({Key? key, required this.text, this.style})
      : super(key: key);

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
