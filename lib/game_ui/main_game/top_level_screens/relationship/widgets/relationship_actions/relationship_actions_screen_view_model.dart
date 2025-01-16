import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/age/age_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/person/selected_person_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/common_states/watch/relationship/specific/selected_relationship_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_systems/main_systems/system_age/age.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/label/get_platonic_and_romantic_relationship_label_from_string.dart.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/label/get_platonic_relationship_label_from_string.dart';

part 'relationship_actions_screen_view_model.g.dart';

class RelationshipActionsScreenData extends Equatable {
  final String firstName;
  final String lastName;
  final String age;
  final String currentRelationshipLabel;
  final String? previousRelationshipLabel;
  final int relationshipLevel;
  final int? romanticRelationshipDuration;
  final List<RelationshipInteraction> interactions;
  final PersonRelationshipPair personRelationshipPair;

  const RelationshipActionsScreenData({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.currentRelationshipLabel,
    required this.previousRelationshipLabel,
    required this.relationshipLevel,
    required this.romanticRelationshipDuration,
    required this.interactions,
    required this.personRelationshipPair,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        age,
        currentRelationshipLabel,
        previousRelationshipLabel,
        relationshipLevel,
        romanticRelationshipDuration,
        interactions,
        personRelationshipPair,
      ];
}

@riverpod
class RelationshipActionsScreenViewModel
    extends _$RelationshipActionsScreenViewModel {
  @override
  Future<RelationshipActionsScreenData?> build({
    required int relationshipPersonId,
    required PersonIdPair playerAndPersonIdPair,
  }) async {
    //we need to watch the person, so we can react to changes
    final Person? person = await ref
        .watch(selectedPersonProvider(personID: relationshipPersonId).future);

    //we need to watch relationship, so we can react to changes
    final Relationship? currentRelationship = await ref.watch(
        selectedRelationshipProvider(personIdPair: playerAndPersonIdPair)
            .future);

    //get current day
    final int? currentDay = await ref.watch(
      currentGameProvider.selectAsync((data) => data?.currentDay),
    );

    //if valid
    if (currentDay != null && person != null && currentRelationship != null) {
      //get age
      final Age age =
          ref.watch(ageUsecasesProvider).getPersonsAgeUsecase.execute(
                currentDay: currentDay,
                dayOfBirth: person.dayOfBirth,
              );

      //current relationship label
      //don't add prev relationship
      final String currentRelationshipLabel =
          getPlatonicAndRomanticRelationshipLabelFromString(
        genderString: person.gender,
        platonicRelationshipTypeString:
            currentRelationship.platonicRelationshipType,
        romanticRelationshipTypeString:
            currentRelationship.romanticRelationshipType,
        previousFamilialRelationshipString: TextConstants.emptyString,
        isCoParent: currentRelationship.isCoParent,
        activeRomance: currentRelationship.activeRomance,
      );

      //previous relationship label
      //if prev relationship is not empty
      //get as main label(not the usual prev relationship formatting)
      final String? previousRelationshipLabel =
          (currentRelationship.previousFamilialRelationship.isEmpty)
              ? null
              : getPlatonicRelationshipLabelFromString(
                  genderString: person.gender,
                  platonicRelationshipTypeString:
                      currentRelationship.previousFamilialRelationship,
                  previousFamilialRelationshipString: TextConstants.emptyString,
                );

      //romantic relationship duration
      final int? romanticRelationshipDuration = ref
          .watch(relationshipUsecasesProvider)
          .getTotalRomanticRelationshipDuration
          .execute(
            currentDay: currentDay,
            relationship: currentRelationship,
          );

      //interactions
      final List<RelationshipInteraction> interactions =
          ref.watch(gameRelationshipInteractionsProvider).all;

      //return
      return RelationshipActionsScreenData(
        firstName: person.firstName,
        lastName: person.lastName,
        age: age.lifeStage.stageName,
        currentRelationshipLabel: currentRelationshipLabel,
        previousRelationshipLabel: previousRelationshipLabel,
        relationshipLevel: currentRelationship.level,
        romanticRelationshipDuration: romanticRelationshipDuration,
        interactions: interactions,
        personRelationshipPair: PersonRelationshipPair(
          person: person,
          relationship: currentRelationship,
        ),
      );
    }

    return null;
  }

  Future<void> executeInteraction(
    RelationshipInteraction relationshipInteraction,
  ) async {
    //get current game
    final Game? currentGame = await ref.read(currentGameProvider.future);
    //get current player
    final Person? currentPlayer = await ref.read(currentPlayerProvider.future);
    //current state
    final RelationshipActionsScreenData? currentState = state.valueOrNull;

    if (currentGame != null && currentPlayer != null && currentState != null) {
      //
      final PersonRelationshipPair personRelationshipPair =
          currentState.personRelationshipPair;

      //relationship label
      final String relationshipLabel =
          getPlatonicAndRomanticRelationshipLabelFromString(
        genderString: personRelationshipPair.person.gender,
        platonicRelationshipTypeString:
            personRelationshipPair.relationship.platonicRelationshipType,
        romanticRelationshipTypeString:
            personRelationshipPair.relationship.romanticRelationshipType,
        previousFamilialRelationshipString:
            personRelationshipPair.relationship.previousFamilialRelationship,
        isCoParent: personRelationshipPair.relationship.isCoParent,
        activeRomance: personRelationshipPair.relationship.activeRomance,
      );

      //
      relationshipInteraction.execute(
        currentGame: currentGame,
        currentPlayer: currentPlayer,
        personRelationshipPair: personRelationshipPair,
        relationshipLabel: relationshipLabel,
      );
    }
  }
}
