import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/torment_dialog/torment_dialog_widget.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/constants/torment_option.dart';

class TormentDialog {
  static Future<TormentOption?> show({
    required BuildContext context,
    required PersonRelationshipPair personRelationshipPair,
    required String relationshipLabel,
  }) async {
    if (context.mounted) {
      return showDismissableDialog<TormentOption>(
        context: context,
        child: TormentDialogWidget(
          personRelationshipPair: personRelationshipPair,
          relationshipLabel: relationshipLabel,
        ),
      );
    }

    return null;
  }
}
