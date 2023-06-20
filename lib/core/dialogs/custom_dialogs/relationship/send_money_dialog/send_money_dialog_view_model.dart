import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/money/convert_money_string_to_int.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/game_relationship_interactions.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final sendMoneyDialogViewModelProvider = Provider<SendMoneyDialogViewModel>(
  (ref) => SendMoneyDialogViewModel(
    ref.watch(
      gameRelationshipInteractionsProvider,
    ),
  ),
);

class SendMoneyDialogViewModel {
  final GameRelationshipInteractions _gameRelationshipInteractions;

  SendMoneyDialogViewModel(
    this._gameRelationshipInteractions,
  );

  String getTitle() {
    return "Send Money";
  }

  String getPrompt({
    required String relationshipLabel,
    required String recieverFirstName,
  }) {
    return "How much do you want to send to your $relationshipLabel, $recieverFirstName?";
  }

  String getHint() {
    return "Enter Amount";
  }

  int getMaxNumbersAllowed() => 8;

  Future<void> sendMoney({
    required String moneyText,
    required BuildContext context,
    required Game currentGame,
    required Person currentPlayer,
    required RelationshipPair relationshipPair,
    required String relationshipLabel,
    required InformalRelationshipType informalRelationshipType,
  }) async {
    return _gameRelationshipInteractions.sendMoneyInteraction
        .executeSendChosenMoneyAmount(
      context: context,
      chosenMoneyAmount: convertMoneyStringToInt(moneyText),
      currentGame: currentGame,
      currentPlayer: currentPlayer,
      relationshipPair: relationshipPair,
      relationshipLabel: relationshipLabel,
      informalRelationshipType: informalRelationshipType,
    );
  }
}
