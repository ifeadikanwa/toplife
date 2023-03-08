import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/relationship/current_player_living_exes_pairs_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final exesScreenViewModelProvider = StateNotifierProvider<ExesScreenViewModel,
    AsyncValue<List<RelationshipPair<Partner>>>>((ref) {
  //get recent
  final exesRelationshipPairsFuture = ref.watch(
    currentPlayerLivingExesPairsProvider.future,
  );

  return ExesScreenViewModel(
    exesPairsFuture: exesRelationshipPairsFuture,
  );
});

class ExesScreenViewModel
    extends StateNotifier<AsyncValue<List<RelationshipPair<Partner>>>> {
  ExesScreenViewModel({
    required Future<List<RelationshipPair<Partner>>> exesPairsFuture,
  }) : super(const AsyncLoading()) {
    _fetch(
      exesPairsFuture: exesPairsFuture,
    );
  }

  void _fetch({
    required Future<List<RelationshipPair<Partner>>> exesPairsFuture,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => exesPairsFuture);
  }
}
