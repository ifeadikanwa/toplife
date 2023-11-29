// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:toplife/core/common_states/get/relationship/current_player_living_active_parent_pairs_provider.dart';
// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_actions/navigate_to_relationship_actions_screen_provider.dart';
// import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
// import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
// import 'package:toplife/main_systems/system_relationship/util/rearrange_parents_list.dart';

// final parentsScreenViewModelProvider = StateNotifierProvider<
//     ParentsScreenViewModel, AsyncValue<List<RelationshipPair<Parent>>>>((ref) {
//   //get recent
//   final activeParentRelationshipPairsFuture = ref.watch(
//     currentPlayerLivingActiveParentPairsProvider.future,
//   );

//   final NavigateToRelationshipActionsScreenNotifier
//       navigateToRelationshipActionsScreenNotifier =
//       ref.watch(navigateToRelationshipActionsScreenNotifierProvider.notifier);

//   return ParentsScreenViewModel(
//     activeParentPairsFuture: activeParentRelationshipPairsFuture,
//     navigateToRelationshipActionsScreenNotifier:
//         navigateToRelationshipActionsScreenNotifier,
//   );
// });

// class ParentsScreenViewModel
//     extends StateNotifier<AsyncValue<List<RelationshipPair<Parent>>>> {
//   final NavigateToRelationshipActionsScreenNotifier
//       _navigateToRelationshipActionsScreenNotifier;

//   ParentsScreenViewModel({
//     required Future<List<RelationshipPair<Parent>>> activeParentPairsFuture,
//     required NavigateToRelationshipActionsScreenNotifier
//         navigateToRelationshipActionsScreenNotifier,
//   })  : _navigateToRelationshipActionsScreenNotifier =
//             navigateToRelationshipActionsScreenNotifier,
//         super(const AsyncLoading()) {
//     _fetch(
//       activeParentPairsFuture: activeParentPairsFuture,
//     );
//   }

//   void _fetch({
//     required Future<List<RelationshipPair<Parent>>> activeParentPairsFuture,
//   }) async {
//     state = const AsyncLoading();

//     final List<RelationshipPair<Parent>> rawActiveParentPairs =
//         await activeParentPairsFuture;
//     final List<RelationshipPair<Parent>> finalActiveParentPairs =
//         rearrangeParentsList(rawActiveParentPairs);

//     state = await AsyncValue.guard(() async => finalActiveParentPairs);
//   }

//   void goToRelationshipActionsScreen({
//     required BuildContext context,
//     required int relationshipPersonID,
//   }) {
//     _navigateToRelationshipActionsScreenNotifier.execute(
//       context: context,
//       relationshipPersonID: relationshipPersonID,
//       relationshipType: InformalRelationshipType.parent,
//     );
//   }
// }
