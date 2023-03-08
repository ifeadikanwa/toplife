import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/relationship/current_player_living_children_pairs_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final childrenScreenViewModelProvider = StateNotifierProvider<
    ChildrenScreenViewModel, AsyncValue<List<RelationshipPair<Child>>>>((ref) {
  //get recent
  final childRelationshipPairsFuture = ref.watch(
    currentPlayerLivingChildrenPairsProvider.future,
  );

  return ChildrenScreenViewModel(
    childPairsFuture: childRelationshipPairsFuture,
  );
});

class ChildrenScreenViewModel
    extends StateNotifier<AsyncValue<List<RelationshipPair<Child>>>> {
  ChildrenScreenViewModel({
    required Future<List<RelationshipPair<Child>>> childPairsFuture,
  }) : super(const AsyncLoading()) {
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
}
