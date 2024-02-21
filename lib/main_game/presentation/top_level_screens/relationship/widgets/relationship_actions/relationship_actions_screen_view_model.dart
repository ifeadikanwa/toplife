import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/age/age_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/person/current_person_usecase.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/common_states/watch/relationship/specific/current_relationship_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/game_relationship_interactions.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_and_romantic_relationship_label_from_string.dart.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_relationship_type_gender_equivalent.dart';
import 'package:toplife/main_systems/system_relationship/util/get_previous_familial_relatonship_enum_from_string.dart';

final relationshipActionsScreenViewModelProvider = StateNotifierProvider.family
    .autoDispose<
        RelationshipActionsScreenViewModel,
        AsyncValue<List<RelationshipInteraction>>,
        PersonRelationshipPair>((ref, personRelationshipPair) {
  //watch needed values

  //usecases
  final AgeUsecases ageUsecases = ref.watch(ageUsecasesProvider);
  final RelationshipUsecases relationshipUsecases =
      ref.watch(relationshipUsecasesProvider);
  final GameRelationshipInteractions gameRelationshipInteractions =
      ref.watch(gameRelationshipInteractionsProvider);

  //data

  //watch person
  final Future<Person?> personFuture =
      ref.watch(currentPersonProvider(personRelationshipPair.person.id).future);

  //watch relationship
  final Future<Relationship?> relationshipFuture =
      ref.watch(currentRelationshipProvider(PersonIdPair(
    firstId: personRelationshipPair.relationship.firstPersonId,
    secondId: personRelationshipPair.relationship.secondPersonId,
  )).future);

  //watch current game
  final Future<Game?> currentGameFuture = ref.watch(currentGameProvider.future);

  //watch current player
  final Future<Person?> currentPlayerFuture =
      ref.watch(currentPlayerProvider.future);

  return RelationshipActionsScreenViewModel(
    ageUsecases: ageUsecases,
    gameRelationshipInteractions: gameRelationshipInteractions,
    relationshipUsecases: relationshipUsecases,
    personFuture: personFuture,
    relationshipFuture: relationshipFuture,
    currentGameFuture: currentGameFuture,
    currentPlayerFuture: currentPlayerFuture,
  );
});

class RelationshipActionsScreenViewModel
    extends StateNotifier<AsyncValue<List<RelationshipInteraction>>> {
  //immutable
  final AgeUsecases _ageUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final GameRelationshipInteractions _gameRelationshipInteractions;

  //mutable
  Game? _currentGame;
  Person? _currentPlayer;
  PersonRelationshipPair? _personRelationshipPair;
  int? _romanticRelationshipDuration;

  //
  RelationshipActionsScreenViewModel({
    required AgeUsecases ageUsecases,
    required RelationshipUsecases relationshipUsecases,
    required GameRelationshipInteractions gameRelationshipInteractions,
    required Future<Person?> personFuture,
    required Future<Relationship?> relationshipFuture,
    required Future<Game?> currentGameFuture,
    required Future<Person?> currentPlayerFuture,
  })  : _ageUsecases = ageUsecases,
        _relationshipUsecases = relationshipUsecases,
        _gameRelationshipInteractions = gameRelationshipInteractions,
        super(const AsyncLoading()) {
    _fetch(
      personFuture: personFuture,
      relationshipFuture: relationshipFuture,
      currentGameFuture: currentGameFuture,
      currentPlayerFuture: currentPlayerFuture,
    );
  }

  Future<void> _fetch({
    required Future<Person?> personFuture,
    required Future<Relationship?> relationshipFuture,
    required Future<Game?> currentGameFuture,
    required Future<Person?> currentPlayerFuture,
  }) async {
    //set state to loading
    state = const AsyncLoading();

    //fetch:

    //get game
    _currentGame = await currentGameFuture;
    //get player
    _currentPlayer = await currentPlayerFuture;

    //get person
    final Person? person = await personFuture;
    //get relationship
    final Relationship? relationship = await relationshipFuture;

    //if they are all valid
    if (_currentGame != null &&
        _currentPlayer != null &&
        person != null &&
        relationship != null) {
      //set the person relationship pair
      _personRelationshipPair = PersonRelationshipPair(
        person: person,
        relationship: relationship,
      );

      //set romantic rel duration

      _romanticRelationshipDuration =
          _relationshipUsecases.getTotalRomanticRelationshipDuration.execute(
        currentDay: _currentGame!.currentDay,
        relationship: relationship,
      );

      //get interactions
      final interactions = _gameRelationshipInteractions.all;

      //finally set state
      state = await AsyncValue.guard(() async => interactions);
    }

    //if game and player and relationship info is not valid:
    //set all values to null
    //set state to empty list
    else {
      _currentGame = null;
      _currentPlayer = null;
      _personRelationshipPair = null;
      state = await AsyncValue.guard(() async => []);
    }
  }

  String getAge() {
    if (_currentGame != null && _personRelationshipPair != null) {
      return _ageUsecases.getPersonsAgeUsecase
          .execute(
            dayOfBirth: _personRelationshipPair!.person.dayOfBirth,
            currentDay: _currentGame!.currentDay,
          )
          .lifeStage
          .stageName;
    } else {
      return TextConstants.dash;
    }
  }

  String getFirstName() {
    if (_personRelationshipPair != null) {
      return _personRelationshipPair!.person.firstName;
    } else {
      return TextConstants.dash;
    }
  }

  String getLastName() {
    if (_personRelationshipPair != null) {
      return _personRelationshipPair!.person.lastName;
    } else {
      return TextConstants.dash;
    }
  }

  int getRelationshipLevel() {
    if (_personRelationshipPair != null) {
      return _personRelationshipPair!.relationship.level;
    } else {
      return 0;
    }
  }

  bool showInfoButton() {
    return true;
  }

  String getCurrentRelationshipLabel() {
    if (_personRelationshipPair != null) {
      //dont add prev relationship
      return getPlatonicAndRomanticRelationshipLabelFromString(
        genderString: _personRelationshipPair!.person.gender,
        platonicRelationshipTypeString:
            _personRelationshipPair!.relationship.platonicRelationshipType,
        romanticRelationshipTypeString:
            _personRelationshipPair!.relationship.romanticRelationshipType,
        previousFamilialRelationshipString: "",
        isCoParent: _personRelationshipPair!.relationship.isCoParent,
        activeRomance: _personRelationshipPair!.relationship.activeRomance,
      );
    } else {
      return TextConstants.dash;
    }
  }

  String? getPrevRelationshipLabel() {
    if (_personRelationshipPair != null) {
      //get it as regular formatting not prev formatting
      final PlatonicRelationshipType? prevRelationshipEnum =
          getPreviousFamilialRelationshipEnumFromString(
        _personRelationshipPair!.relationship.previousFamilialRelationship,
      );

      final String? prevRelationshipLabel = (prevRelationshipEnum != null)
          ? getPlatonicRelationshipTypeGenderEquivalent(
              prevRelationshipEnum,
              _personRelationshipPair!.person.gender,
            )
          : null;

      return prevRelationshipLabel;
    } else {
      return null;
    }
  }

  int? getRomanticRelationshipDuration() {
    return _romanticRelationshipDuration;
  }

  Future<void> executeInteraction({
    required RelationshipInteraction relationshipInteraction,
    required BuildContext context,
  }) async {
    // if (_currentGame != null &&
    //     _currentPlayer != null &&
    //     _personRelationshipPair != null) {
    //   await relationshipInteraction.execute(
    //     context: context,
    //     currentGame: _currentGame!,
    //     currentPlayer: _currentPlayer!,
    //     relationshipPair: _personRelationshipPair!,
    //     relationshipLabel: getCurrentRelationshipLabel(),
    //     informalRelationshipType:
    //         _personRelationshipPair!.informalRelationshipType,
    //   );

    //   _fetch();
    // }
  }
}

// final relationshipActionsScreenViewModelProvider =
//     FutureProvider.autoDispose<RelationshipActionsScreenViewModel>((ref) async {
//   //watch needed values
//   final Game? currentGame = await ref.watch(currentGameProvider.future);
//   final Person? currentPlayer = await ref.watch(currentPlayerProvider.future);
//   final AgeUsecases ageUsecases = ref.watch(ageUsecasesProvider);

//   final RelationshipSearchInfo? relationshipSearchInfo =
//       ref.watch(navigateToRelationshipActionsScreenNotifierProvider);

//   final RelationshipPair? relationshipPair = (relationshipSearchInfo != null &&
//           relationshipSearchInfo.informalRelationshipType ==
//               InformalRelationshipType.child)
//       ? await ref.watch(currentChildRelationshipPairProvider(
//               relationshipSearchInfo.relationshipPersonID)
//           .future)
//       : null;

//   //relationship interactions
//   final GameRelationshipInteractions gameRelationshipInteractions =
//       ref.watch(gameRelationshipInteractionsProvider);

//   late final List<RelationshipInteraction> relationshipInteractions;
//   if (currentGame != null && currentPlayer != null) {
//     //call getter function for interactions
//     relationshipInteractions = gameRelationshipInteractions.all;
//   } else {
//     relationshipInteractions = [];
//   }

//   return RelationshipActionsScreenViewModel(
//     relationshipInteractions: relationshipInteractions,
//     currentGame: currentGame,
//     currentPlayer: currentPlayer,
//     relationshipPair: relationshipPair,
//     ageUsecases: ageUsecases,
//   );
// });

// class RelationshipActionsScreenViewModel {
//   final List<RelationshipInteraction> relationshipInteractions;
//   final Game? _currentGame;
//   final Person? _currentPlayer;
//   final RelationshipPair? _personRelationshipPair;
//   final AgeUsecases _ageUsecases;

//   const RelationshipActionsScreenViewModel({
//     required this.relationshipInteractions,
//     required Game? currentGame,
//     required Person? currentPlayer,
//     required RelationshipPair? relationshipPair,
//     required AgeUsecases ageUsecases,
//   })  : _ageUsecases = ageUsecases,
//         _personRelationshipPair = relationshipPair,
//         _currentPlayer = currentPlayer,
//         _currentGame = currentGame;

//   //get age
//   String getAge() {
//     if (_currentGame != null && _personRelationshipPair != null) {
//       return _ageUsecases.getPersonAgeUsecase
//           .execute(
//             dayOfBirth: _personRelationshipPair!.person.dayOfBirth,
//             currentDay: _currentGame!.currentDay,
//           )
//           .lifeStage
//           .stageName;
//     } else {
//       return TextConstants.dash;
//     }
//   }

//   String getFirstName() {
//     if (_personRelationshipPair != null) {
//       return _personRelationshipPair!.person.firstName;
//     } else {
//       return TextConstants.dash;
//     }
//   }

//   String getLastName() {
//     if (_personRelationshipPair != null) {
//       return _personRelationshipPair!.person.lastName;
//     } else {
//       return TextConstants.dash;
//     }
//   }

//   int getRelationshipLevel() {
//     if (_personRelationshipPair != null && _personRelationshipPair?.relationship is Child) {
//       final childRelationship = _personRelationshipPair!.relationship as Child;
//       return childRelationship.relationship;
//     } else {
//       return 0;
//     }
//   }

//   Future<void> executeInteraction({
//     required RelationshipInteraction relationshipInteraction,
//     required BuildContext context,
//     required String relationshipLabel,
//   }) async {
//     if (_currentGame != null &&
//         _currentPlayer != null &&
//         _personRelationshipPair != null) {
//       await relationshipInteraction.execute(
//         context: context,
//         currentGame: _currentGame!,
//         currentPlayer: _currentPlayer!,
//         relationshipPair: _personRelationshipPair!,
//         relationshipLabel: relationshipLabel,
//         informalRelationshipType: _personRelationshipPair!.informalRelationshipType,
//       );
//     }
//   }
// }
