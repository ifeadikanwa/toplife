import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/game_relationship_interactions.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_pair.dart';

final sendFoodDialogViewModelProvider =
    StateNotifierProvider.autoDispose<SendFoodDialogViewModel, FridgeFoodPair?>(
  (ref) => SendFoodDialogViewModel(
    ref.watch(
      gameRelationshipInteractionsProvider,
    ),
  ),
);

class SendFoodDialogViewModel extends StateNotifier<FridgeFoodPair?> {
  final GameRelationshipInteractions _gameRelationshipInteractions;

  SendFoodDialogViewModel(
    this._gameRelationshipInteractions,
  ) : super(null);

  String getTitle() {
    return "Send Food";
  }

  String getPrompt({
    required String relationshipLabel,
    required String recieverFirstName,
  }) {
    return "What food do you want to send to your $relationshipLabel, $recieverFirstName?";
  }

  void updateChosenFood(FridgeFoodPair? fridgeFoodPair) {
    state = fridgeFoodPair;
  }

  Future<void> executeSendFood({
    required BuildContext context,
    required Game currentGame,
    required Person currentPlayer,
    required RelationshipPair relationshipPair,
    required String relationshipLabel,
    required InformalRelationshipType informalRelationshipType,
  }) async {
    final FridgeFoodPair? chosenFood = state;

    if (chosenFood != null) {
      return _gameRelationshipInteractions.sendFoodInteraction
          .executeSendChosenFoodOption(
        context: context,
        chosenFoodOption: chosenFood,
        currentGame: currentGame,
        currentPlayer: currentPlayer,
        relationshipPair: relationshipPair,
        relationshipLabel: relationshipLabel,
        informalRelationshipType: informalRelationshipType,
      );
    }
  }
}
