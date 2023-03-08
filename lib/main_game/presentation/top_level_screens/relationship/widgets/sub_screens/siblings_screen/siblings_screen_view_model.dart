import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/relationship/current_player_living_sibling_pairs_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final siblingsScreenViewModelProvider = StateNotifierProvider<SiblingsScreenViewModel,
    AsyncValue<List<RelationshipPair<Sibling>>>>((ref) {
  //get recent
  final siblingRelationshipPairsFuture = ref.watch(
    currentPlayerLivingSiblingPairsProvider.future,
  );

  return SiblingsScreenViewModel(
    siblingPairsFuture: siblingRelationshipPairsFuture,
  );
});

class SiblingsScreenViewModel
    extends StateNotifier<AsyncValue<List<RelationshipPair<Sibling>>>> {
  SiblingsScreenViewModel({
    required Future<List<RelationshipPair<Sibling>>> siblingPairsFuture,
  }) : super(const AsyncLoading()) {
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
}
