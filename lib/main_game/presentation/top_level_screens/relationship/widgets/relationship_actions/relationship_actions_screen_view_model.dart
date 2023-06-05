import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/age/age_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_actions/navigate_to_relationship_actions_screen_provider.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/game_relationship_interactions.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_search_info.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/get_relationship_label.dart';

final relationshipActionsScreenViewModelProvider =
    StateNotifierProvider.autoDispose<RelationshipActionsScreenViewModel,
        AsyncValue<List<RelationshipInteraction>>>((ref) {
  //watch needed values
  //usecases
  final AgeUsecases ageUsecases = ref.watch(ageUsecasesProvider);
  final GameUsecases gameUsecases = ref.watch(gameUsecasesProvider);
  final PersonUsecases personUsecases = ref.watch(personUsecasesProvider);
  final RelationshipUsecases relationshipUsecases =
      ref.watch(relationshipUsecasesProvider);
  final GameRelationshipInteractions gameRelationshipInteractions =
      ref.watch(gameRelationshipInteractionsProvider);
  //data
  final RelationshipSearchInfo? relationshipSearchInfo =
      ref.watch(navigateToRelationshipActionsScreenNotifierProvider);

  return RelationshipActionsScreenViewModel(
    relationshipSearchInfo: relationshipSearchInfo,
    ageUsecases: ageUsecases,
    gameUsecases: gameUsecases,
    personUsecases: personUsecases,
    relationshipUsecases: relationshipUsecases,
    gameRelationshipInteractions: gameRelationshipInteractions,
  );
});

class RelationshipActionsScreenViewModel
    extends StateNotifier<AsyncValue<List<RelationshipInteraction>>> {
  //immutable
  final AgeUsecases _ageUsecases;
  final GameUsecases _gameUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final GameRelationshipInteractions _gameRelationshipInteractions;
  final RelationshipSearchInfo? _relationshipSearchInfo;

  //mutable
  Game? _currentGame;
  Person? _currentPlayer;
  RelationshipPair? _relationshipPair;

  //
  RelationshipActionsScreenViewModel({
    required RelationshipSearchInfo? relationshipSearchInfo,
    required AgeUsecases ageUsecases,
    required GameUsecases gameUsecases,
    required PersonUsecases personUsecases,
    required RelationshipUsecases relationshipUsecases,
    required GameRelationshipInteractions gameRelationshipInteractions,
  })  : _ageUsecases = ageUsecases,
        _gameUsecases = gameUsecases,
        _relationshipUsecases = relationshipUsecases,
        _gameRelationshipInteractions = gameRelationshipInteractions,
        _relationshipSearchInfo = relationshipSearchInfo,
        super(const AsyncLoading()) {
    _fetch();
  }

  Future<void> _fetch() async {
    //set state to loading
    state = const AsyncLoading();

    //fetch
    //get current game and player first
    final PersonGamePair? currentGameAndPlayer =
        await _gameUsecases.getCurrentGameAndPlayerUsecase.execute();

    //if game and player is valid AND relationship search info is valid: we can move on
    if (currentGameAndPlayer != null && _relationshipSearchInfo != null) {
      //set values to global variable
      _currentGame = currentGameAndPlayer.game;
      _currentPlayer = currentGameAndPlayer.person;

      //get relationship pair
      _relationshipPair =
          await _relationshipUsecases.getAnyRelationshipPairUsecase.execute(
        mainPersonID: _currentPlayer!.id,
        relationshipPersonID: _relationshipSearchInfo!.relationshipPersonID,
        informalRelationshipType:
            _relationshipSearchInfo!.informalRelationshipType,
      );

      //get interactions
      final interactions = _gameRelationshipInteractions.all;

      //finally set state
      state = await AsyncValue.guard(() async => interactions);
    }
    //if game and player and relationship search info is not valid:
    //set all values to null
    //set state to empty list
    else {
      _currentGame = null;
      _currentPlayer = null;
      _relationshipPair = null;
      state = await AsyncValue.guard(() async => []);
    }
  }

  String getAge() {
    if (_currentGame != null && _relationshipPair != null) {
      return _ageUsecases.getPersonAgeUsecase
          .execute(
            dayOfBirth: _relationshipPair!.person.dayOfBirth,
            currentDay: _currentGame!.currentDay,
          )
          .lifeStage
          .stageName;
    } else {
      return TextConstants.dash;
    }
  }

  String getFirstName() {
    if (_relationshipPair != null) {
      return _relationshipPair!.person.firstName;
    } else {
      return TextConstants.dash;
    }
  }

  String getLastName() {
    if (_relationshipPair != null) {
      return _relationshipPair!.person.lastName;
    } else {
      return TextConstants.dash;
    }
  }

  int getRelationshipLevel() {
    const int noRelationshipLevelFound = 0;

    if (_relationshipPair != null) {
      return _relationshipUsecases
              .getRelationshipLevelFromAnyGivenRelationshipPairUsecase
              .execute(relationshipPair: _relationshipPair!) ??
          noRelationshipLevelFound;
    } else {
      return noRelationshipLevelFound;
    }
  }

  bool showInfoButton() {
    return true;
  }

  String getRelationshipLabel() {
    if (_relationshipPair != null) {
      return getRelationshipLabelFromAnyRelationshipPair(
        relationshipPair: _relationshipPair!,
        onlyActivePartnerWanted: false,
      );
    } else {
      return TextConstants.dash;
    }
  }

  Future<void> executeInteraction({
    required RelationshipInteraction relationshipInteraction,
    required BuildContext context,
  }) async {
    if (_currentGame != null &&
        _currentPlayer != null &&
        _relationshipPair != null) {
      await relationshipInteraction.execute(
        context: context,
        currentGame: _currentGame!,
        currentPlayer: _currentPlayer!,
        relationshipPair: _relationshipPair!,
        relationshipLabel: getRelationshipLabel(),
        informalRelationshipType: _relationshipPair!.informalRelationshipType,
      );

      _fetch();
    }
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
//   final RelationshipPair? _relationshipPair;
//   final AgeUsecases _ageUsecases;

//   const RelationshipActionsScreenViewModel({
//     required this.relationshipInteractions,
//     required Game? currentGame,
//     required Person? currentPlayer,
//     required RelationshipPair? relationshipPair,
//     required AgeUsecases ageUsecases,
//   })  : _ageUsecases = ageUsecases,
//         _relationshipPair = relationshipPair,
//         _currentPlayer = currentPlayer,
//         _currentGame = currentGame;

//   //get age
//   String getAge() {
//     if (_currentGame != null && _relationshipPair != null) {
//       return _ageUsecases.getPersonAgeUsecase
//           .execute(
//             dayOfBirth: _relationshipPair!.person.dayOfBirth,
//             currentDay: _currentGame!.currentDay,
//           )
//           .lifeStage
//           .stageName;
//     } else {
//       return TextConstants.dash;
//     }
//   }

//   String getFirstName() {
//     if (_relationshipPair != null) {
//       return _relationshipPair!.person.firstName;
//     } else {
//       return TextConstants.dash;
//     }
//   }

//   String getLastName() {
//     if (_relationshipPair != null) {
//       return _relationshipPair!.person.lastName;
//     } else {
//       return TextConstants.dash;
//     }
//   }

//   int getRelationshipLevel() {
//     if (_relationshipPair != null && _relationshipPair?.relationship is Child) {
//       final childRelationship = _relationshipPair!.relationship as Child;
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
//         _relationshipPair != null) {
//       await relationshipInteraction.execute(
//         context: context,
//         currentGame: _currentGame!,
//         currentPlayer: _currentPlayer!,
//         relationshipPair: _relationshipPair!,
//         relationshipLabel: relationshipLabel,
//         informalRelationshipType: _relationshipPair!.informalRelationshipType,
//       );
//     }
//   }
// }
