// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:toplife/core/common_states/get/relationship/current_player_living_relatives_pairs_provider.dart';
// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_actions/navigate_to_relationship_actions_screen_provider.dart';
// import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
// import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
// import 'package:toplife/main_systems/system_relationship/util/rearrange_relatives_list.dart';

// final relativesScreenViewModelProvider = StateNotifierProvider<
//     RelativesScreenViewModel,
//     AsyncValue<List<RelationshipPair<Relative>>>>((ref) {
//   //get recent
//   final relativeRelationshipPairsFuture = ref.watch(
//     currentPlayerLivingRelativePairsProvider.future,
//   );

//   final NavigateToRelationshipActionsScreenNotifier
//       navigateToRelationshipActionsScreenNotifier =
//       ref.watch(navigateToRelationshipActionsScreenNotifierProvider.notifier);

//   return RelativesScreenViewModel(
//     relativePairsFuture: relativeRelationshipPairsFuture,
//     navigateToRelationshipActionsScreenNotifier:
//         navigateToRelationshipActionsScreenNotifier,
//   );
// });

// class RelativesScreenViewModel
//     extends StateNotifier<AsyncValue<List<RelationshipPair<Relative>>>> {
//   final NavigateToRelationshipActionsScreenNotifier
//       _navigateToRelationshipActionsScreenNotifier;

//   RelativesScreenViewModel({
//     required Future<List<RelationshipPair<Relative>>> relativePairsFuture,
//     required NavigateToRelationshipActionsScreenNotifier
//         navigateToRelationshipActionsScreenNotifier,
//   })  : _navigateToRelationshipActionsScreenNotifier =
//             navigateToRelationshipActionsScreenNotifier,
//         super(const AsyncLoading()) {
//     _fetch(
//       relativePairsFuture: relativePairsFuture,
//     );
//   }

//   void _fetch({
//     required Future<List<RelationshipPair<Relative>>> relativePairsFuture,
//   }) async {
//     state = const AsyncLoading();

//     final List<RelationshipPair<Relative>> rawRelativePairs =
//         await relativePairsFuture;
//     final List<RelationshipPair<Relative>> finalRelativePairs =
//         rearrangeRelativesList(rawRelativePairs);
//     state = await AsyncValue.guard(() async => finalRelativePairs);
//   }

//   void goToRelationshipActionsScreen({
//     required BuildContext context,
//     required int relationshipPersonID,
//   }) {
//     _navigateToRelationshipActionsScreenNotifier.execute(
//       context: context,
//       relationshipPersonID: relationshipPersonID,
//       relationshipType: InformalRelationshipType.relative,
//     );
//   }
// }
