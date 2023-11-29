// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:toplife/core/common_states/get/relationship/current_player_living_friend_pairs_provider.dart';
// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_actions/navigate_to_relationship_actions_screen_provider.dart';
// import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
// import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

// final friendsScreenViewModelProvider = StateNotifierProvider<
//     FriendsScreenViewModel, AsyncValue<List<RelationshipPair<Friend>>>>((ref) {
//   //get recent
//   final friendRelationshipPairsFuture = ref.watch(
//     currentPlayerLivingFriendPairsProvider.future,
//   );

//   final NavigateToRelationshipActionsScreenNotifier
//       navigateToRelationshipActionsScreenNotifier =
//       ref.watch(navigateToRelationshipActionsScreenNotifierProvider.notifier);

//   return FriendsScreenViewModel(
//     friendPairsFuture: friendRelationshipPairsFuture,
//     navigateToRelationshipActionsScreenNotifier:
//         navigateToRelationshipActionsScreenNotifier,
//   );
// });

// class FriendsScreenViewModel
//     extends StateNotifier<AsyncValue<List<RelationshipPair<Friend>>>> {
//   final NavigateToRelationshipActionsScreenNotifier
//       _navigateToRelationshipActionsScreenNotifier;

//   FriendsScreenViewModel({
//     required Future<List<RelationshipPair<Friend>>> friendPairsFuture,
//     required NavigateToRelationshipActionsScreenNotifier
//         navigateToRelationshipActionsScreenNotifier,
//   })  : _navigateToRelationshipActionsScreenNotifier =
//             navigateToRelationshipActionsScreenNotifier,
//         super(const AsyncLoading()) {
//     _fetch(
//       friendPairsFuture: friendPairsFuture,
//     );
//   }

//   void _fetch({
//     required Future<List<RelationshipPair<Friend>>> friendPairsFuture,
//   }) async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() async => friendPairsFuture);
//   }

//   void goToRelationshipActionsScreen({
//     required BuildContext context,
//     required int relationshipPersonID,
//   }) {
//     _navigateToRelationshipActionsScreenNotifier.execute(
//       context: context,
//       relationshipPersonID: relationshipPersonID,
//       relationshipType: InformalRelationshipType.friend,
//     );
//   }
// }
