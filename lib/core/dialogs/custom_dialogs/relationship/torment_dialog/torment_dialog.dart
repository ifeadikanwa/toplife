import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/torment_dialog/torment_dialog_widget.dart';

class AttendRegularEventDialog {
  static Future<void> show({
    required BuildContext context,
  }) async {
    if (context.mounted) {
      return showDialog(
        context: context,
        builder: (BuildContext context) => const TormentDialogWidget(),
      );
    }
  }
}
