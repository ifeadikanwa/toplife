// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
// import 'package:toplife/core/common_states/watch/relationship/players_relationships/current_player_friends_provider.dart';
// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

// final currentPlayerLivingFriendPairsProvider =
//     FutureProvider<List<RelationshipPair<Friend>>>((ref) async {
//   final List<Friend> allFriends =
//       await ref.watch(currentPlayerFriendsProvider.future);

//   return ref
//       .watch(relationshipUsecasesProvider)
//       .getFriendRelationshipPairsFromFriendsUsecase
//       .execute(
//         friends: allFriends,
//         onlyLivingPeople: true,
//       );
// });
