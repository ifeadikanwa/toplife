import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';

class ResultDialog {
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String result,
  }) async {
    if (context.mounted) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return DialogContainer(
            title: DialogTitleText(text: title),
            children: [
              Center(
                child: DialogBodyText(text: result),
              )
            ],
          );
        },
      );
    }
  }
}
