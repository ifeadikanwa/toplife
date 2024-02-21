import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/send_money_dialog/send_money_dialog_widget.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';

class SendMoneyDialog {
  static Future<int?> show({
    required BuildContext context,
    required PersonRelationshipPair personRelationshipPair,
    required String relationshipLabel,
  }) async {
    if (context.mounted) {
      return showDismissableDialog<int>(
        context: context,
        child: SendMoneyDialogWidget(
          personRelationshipPair: personRelationshipPair,
          relationshipLabel: relationshipLabel,
        ),
      );
    }

    return null;
  }
}
