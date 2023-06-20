import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/torment_dialog/torment_dialog_widget.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

class TormentDialog {
  static Future<void> show({
    required BuildContext context,
    required Game currentGame,
    required Person currentPlayer,
    required RelationshipPair relationshipPair,
    required String relationshipLabel,
    required InformalRelationshipType informalRelationshipType,
  }) async {
    if (context.mounted) {
      return showDialog(
        context: context,
        builder: (BuildContext context) => TormentDialogWidget(
          currentGame: currentGame,
          currentPlayer: currentPlayer,
          relationshipPair: relationshipPair,
          informalRelationshipType: informalRelationshipType,
          relationshipLabel: relationshipLabel,
        ),
      );
    }
  }
}
