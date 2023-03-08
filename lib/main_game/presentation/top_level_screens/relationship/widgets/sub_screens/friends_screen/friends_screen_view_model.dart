import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/relationship/current_player_living_friend_pairs_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final friendsScreenViewModelProvider = StateNotifierProvider<FriendsScreenViewModel,
    AsyncValue<List<RelationshipPair<Friend>>>>((ref) {
  //get recent
  final friendRelationshipPairsFuture = ref.watch(
    currentPlayerLivingFriendPairsProvider.future,
  );

  return FriendsScreenViewModel(
    friendPairsFuture: friendRelationshipPairsFuture,
  );
});

class FriendsScreenViewModel
    extends StateNotifier<AsyncValue<List<RelationshipPair<Friend>>>> {
  FriendsScreenViewModel({
    required Future<List<RelationshipPair<Friend>>> friendPairsFuture,
  }) : super(const AsyncLoading()) {
    _fetch(
      friendPairsFuture: friendPairsFuture,
    );
  }

  void _fetch({
    required Future<List<RelationshipPair<Friend>>> friendPairsFuture,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => friendPairsFuture);
  }
}
