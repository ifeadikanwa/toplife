// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:toplife/core/common_states/get/relationship/current_player_living_exes_pairs_provider.dart';
// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_actions/navigate_to_relationship_actions_screen_provider.dart';
// import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
// import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

// final exesScreenViewModelProvider = StateNotifierProvider<ExesScreenViewModel,
//     AsyncValue<List<RelationshipPair<Partner>>>>((ref) {
//   //get recent
//   final exesRelationshipPairsFuture = ref.watch(
//     currentPlayerLivingExesPairsProvider.future,
//   );

//   final NavigateToRelationshipActionsScreenNotifier
//       navigateToRelationshipActionsScreenNotifier =
//       ref.watch(navigateToRelationshipActionsScreenNotifierProvider.notifier);

//   return ExesScreenViewModel(
//     exesPairsFuture: exesRelationshipPairsFuture,
//     navigateToRelationshipActionsScreenNotifier:
//         navigateToRelationshipActionsScreenNotifier,
//   );
// });

// class ExesScreenViewModel
//     extends StateNotifier<AsyncValue<List<RelationshipPair<Partner>>>> {
//   final NavigateToRelationshipActionsScreenNotifier
//       _navigateToRelationshipActionsScreenNotifier;

//   ExesScreenViewModel({
//     required Future<List<RelationshipPair<Partner>>> exesPairsFuture,
//     required NavigateToRelationshipActionsScreenNotifier
//         navigateToRelationshipActionsScreenNotifier,
//   })  : _navigateToRelationshipActionsScreenNotifier =
//             navigateToRelationshipActionsScreenNotifier,
//         super(const AsyncLoading()) {
//     _fetch(
//       exesPairsFuture: exesPairsFuture,
//     );
//   }

//   void _fetch({
//     required Future<List<RelationshipPair<Partner>>> exesPairsFuture,
//   }) async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() async => exesPairsFuture);
//   }

//   void goToRelationshipActionsScreen({
//     required BuildContext context,
//     required int relationshipPersonID,
//   }) {
//     _navigateToRelationshipActionsScreenNotifier.execute(
//       context: context,
//       relationshipPersonID: relationshipPersonID,
//       relationshipType: InformalRelationshipType.partner,
//     );
//   }
// }
