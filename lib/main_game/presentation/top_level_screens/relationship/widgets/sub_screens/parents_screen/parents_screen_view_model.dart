import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/relationship/current_player_living_active_parent_pairs_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/util/rearrange_parents_list.dart';

final parentsScreenViewModelProvider = StateNotifierProvider<
    ParentsScreenViewModel, AsyncValue<List<RelationshipPair<Parent>>>>((ref) {
  //get recent
  final activeParentRelationshipPairsFuture = ref.watch(
    currentPlayerLivingActiveParentPairsProvider.future,
  );

  return ParentsScreenViewModel(
    activeParentPairsFuture: activeParentRelationshipPairsFuture,
  );
});

class ParentsScreenViewModel
    extends StateNotifier<AsyncValue<List<RelationshipPair<Parent>>>> {
  ParentsScreenViewModel({
    required Future<List<RelationshipPair<Parent>>> activeParentPairsFuture,
  }) : super(const AsyncLoading()) {
    _fetch(
      activeParentPairsFuture: activeParentPairsFuture,
    );
  }

  void _fetch({
    required Future<List<RelationshipPair<Parent>>> activeParentPairsFuture,
  }) async {
    state = const AsyncLoading();

    final List<RelationshipPair<Parent>> rawActiveParentPairs =
        await activeParentPairsFuture;
    final List<RelationshipPair<Parent>> finalActiveParentPairs =
        rearrangeParentsList(rawActiveParentPairs);

    state = await AsyncValue.guard(() async => finalActiveParentPairs);
  }
}
