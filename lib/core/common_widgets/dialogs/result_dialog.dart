import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/dialogs/dialog_constants/dialog_constants.dart';
import 'package:toplife/core/common_widgets/dialogs/dialog_constants/dialog_container.dart';
import 'package:toplife/core/common_widgets/dialogs/dialog_constants/dialog_text.dart';

class ResultDialog {
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String result,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return DialogContainer(
          title: DialogText(text: title),
          children: [
            Center(
              child: DialogText(
                text: result,
                style: DialogConstants.descriptionTextStyle,
              ),
            )
          ],
        );
      },
    );
  }
}
