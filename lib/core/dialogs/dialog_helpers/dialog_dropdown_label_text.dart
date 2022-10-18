import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';

class DialogDropdownLabelText extends StatelessWidget {
  final String text;
  const DialogDropdownLabelText({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: TextAlign.start,
      style: DialogConstants.defaultBodyTextStyle.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
