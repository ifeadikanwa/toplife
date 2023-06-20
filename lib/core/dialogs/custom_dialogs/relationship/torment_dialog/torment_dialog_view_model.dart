import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/constants/torment_option.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/game_relationship_interactions.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final tormentDialogViewModelProvider =
    StateNotifierProvider.autoDispose<TormentDialogViewModel, TormentOption>(
        (ref) {
  return TormentDialogViewModel(
    gameRelationshipInteractions:
        ref.watch(gameRelationshipInteractionsProvider),
  );
});

class TormentDialogViewModel extends StateNotifier<TormentOption> {
  final GameRelationshipInteractions gameRelationshipInteractions;

  TormentDialogViewModel({
    required this.gameRelationshipInteractions,
  }) : super(TormentOption.insult);

  String getTitle() {
    return "Torment";
  }

  String getPrompt({
    required String relationshipLabel,
    required String recieverFirstName,
  }) {
    return "How do you want to torment your $relationshipLabel, $recieverFirstName?";
  }

  void updateTormentOption(TormentOption tormentOption) {
    state = tormentOption;
  }

  Future<void> executeTormentOption({
    required BuildContext context,
    required Game currentGame,
    required Person currentPlayer,
    required RelationshipPair relationshipPair,
    required String relationshipLabel,
    required InformalRelationshipType informalRelationshipType,
  }) {
    return gameRelationshipInteractions.tormentInteraction.executeTormentOption(
      context: context,
      chosenTormentOption: state,
      currentGame: currentGame,
      currentPlayer: currentPlayer,
      relationshipPair: relationshipPair,
      relationshipLabel: relationshipLabel,
      informalRelationshipType: informalRelationshipType,
    );
  }
}
