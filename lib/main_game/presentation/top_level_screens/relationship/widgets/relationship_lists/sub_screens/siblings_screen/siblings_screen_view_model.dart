import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/relationship/current_player_living_sibling_pairs_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_actions/navigate_to_relationship_actions_screen_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final siblingsScreenViewModelProvider = StateNotifierProvider<
    SiblingsScreenViewModel,
    AsyncValue<List<RelationshipPair<Sibling>>>>((ref) {
  //get recent
  final siblingRelationshipPairsFuture = ref.watch(
    currentPlayerLivingSiblingPairsProvider.future,
  );

  final NavigateToRelationshipActionsScreenNotifier
      navigateToRelationshipActionsScreenNotifier =
      ref.watch(navigateToRelationshipActionsScreenNotifierProvider.notifier);

  return SiblingsScreenViewModel(
    siblingPairsFuture: siblingRelationshipPairsFuture,
    navigateToRelationshipActionsScreenNotifier:
        navigateToRelationshipActionsScreenNotifier,
  );
});

class SiblingsScreenViewModel
    extends StateNotifier<AsyncValue<List<RelationshipPair<Sibling>>>> {
  final NavigateToRelationshipActionsScreenNotifier
      _navigateToRelationshipActionsScreenNotifier;

  SiblingsScreenViewModel({
    required Future<List<RelationshipPair<Sibling>>> siblingPairsFuture,
    required NavigateToRelationshipActionsScreenNotifier
        navigateToRelationshipActionsScreenNotifier,
  })  : _navigateToRelationshipActionsScreenNotifier =
            navigateToRelationshipActionsScreenNotifier,
        super(const AsyncLoading()) {
    _fetch(
      siblingPairsFuture: siblingPairsFuture,
    );
  }

  void _fetch({
    required Future<List<RelationshipPair<Sibling>>> siblingPairsFuture,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => siblingPairsFuture);
  }

  void goToRelationshipActionsScreen({
    required BuildContext context,
    required int relationshipPersonID,
  }) {
    _navigateToRelationshipActionsScreenNotifier.execute(
      context: context,
      relationshipPersonID: relationshipPersonID,
      relationshipType: InformalRelationshipType.sibling,
    );
  }
}
