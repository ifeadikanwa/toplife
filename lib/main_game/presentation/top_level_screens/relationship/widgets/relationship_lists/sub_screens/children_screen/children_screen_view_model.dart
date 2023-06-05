import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/relationship/current_player_living_children_pairs_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_actions/navigate_to_relationship_actions_screen_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final childrenScreenViewModelProvider = StateNotifierProvider<
    ChildrenScreenViewModel, AsyncValue<List<RelationshipPair<Child>>>>((ref) {
  //get recent
  final childRelationshipPairsFuture = ref.watch(
    currentPlayerLivingChildrenPairsProvider.future,
  );

  final NavigateToRelationshipActionsScreenNotifier
      navigateToRelationshipActionsScreenNotifier =
      ref.watch(navigateToRelationshipActionsScreenNotifierProvider.notifier);

  return ChildrenScreenViewModel(
    childPairsFuture: childRelationshipPairsFuture,
    navigateToRelationshipActionsScreenNotifier:
        navigateToRelationshipActionsScreenNotifier,
  );
});

class ChildrenScreenViewModel
    extends StateNotifier<AsyncValue<List<RelationshipPair<Child>>>> {
  final NavigateToRelationshipActionsScreenNotifier
      _navigateToRelationshipActionsScreenNotifier;

  ChildrenScreenViewModel({
    required Future<List<RelationshipPair<Child>>> childPairsFuture,
    required NavigateToRelationshipActionsScreenNotifier
        navigateToRelationshipActionsScreenNotifier,
  })  : _navigateToRelationshipActionsScreenNotifier =
            navigateToRelationshipActionsScreenNotifier,
        super(const AsyncLoading()) {
    _fetch(
      childPairsFuture: childPairsFuture,
    );
  }

  void _fetch({
    required Future<List<RelationshipPair<Child>>> childPairsFuture,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => childPairsFuture);
  }

  void goToRelationshipActionsScreen({
    required BuildContext context,
    required int relationshipPersonID,
  }) =>
      _navigateToRelationshipActionsScreenNotifier.execute(
        context: context,
        relationshipPersonID: relationshipPersonID,
        relationshipType: InformalRelationshipType.child,
      );
}
