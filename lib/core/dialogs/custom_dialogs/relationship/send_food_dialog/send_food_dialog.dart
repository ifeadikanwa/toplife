import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/send_food_dialog/send_food_dialog_widget.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_pair.dart';

class SendFoodDialog {
  static Future<void> show({
    required BuildContext context,
    required List<FridgeFoodPair> fridgeFoodPairs,
    required Game currentGame,
    required Person currentPlayer,
    required RelationshipPair relationshipPair,
    required String relationshipLabel,
    required InformalRelationshipType informalRelationshipType,
  }) async {
    if (context.mounted) {
      return showDismissableDialog(
        context: context,
        child: SendFoodDialogWidget(
          currentGame: currentGame,
          currentPlayer: currentPlayer,
          relationshipPair: relationshipPair,
          informalRelationshipType: informalRelationshipType,
          relationshipLabel: relationshipLabel,
          foodOptions: fridgeFoodPairs,
        ),
      );
    }
  }
}
