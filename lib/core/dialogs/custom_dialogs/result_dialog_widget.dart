import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';

class ResultDialogWidget extends StatelessWidget {
  final String title;
  final String result;

  const ResultDialogWidget({
    Key? key,
    required this.title,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogContainer(
      title: DialogTitleText(text: title),
      children: [
        Center(
          child: DialogBodyText(text: result),
        )
      ],
    );
  }
}
