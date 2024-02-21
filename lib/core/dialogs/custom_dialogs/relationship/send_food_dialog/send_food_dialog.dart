import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/send_food_dialog/send_food_dialog_widget.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_pair.dart';

class SendFoodDialog {
  static Future<FridgeFoodPair?> show({
    required BuildContext context,
    required List<FridgeFoodPair> fridgeFoodPairs,
    required PersonRelationshipPair personRelationshipPair,
    required String relationshipLabel,
  }) async {
    if (context.mounted) {
      return showDismissableDialog<FridgeFoodPair>(
        context: context,
        child: SendFoodDialogWidget(
          personRelationshipPair: personRelationshipPair,
          relationshipLabel: relationshipLabel,
          foodOptions: fridgeFoodPairs,
        ),
      );
    }

    return null;
  }
}
