import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/watch/relationship/current_player_graves_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final gravesScreenViewModelProvider = StateNotifierProvider<GravesScreenViewModel,
    AsyncValue<List<Grave>>>((ref) {
  //get recent
  final graveRelationshipsFuture = ref.watch(
    currentPlayerGravesProvider.future,
  );

  return GravesScreenViewModel(
    graveRelationshipsFuture: graveRelationshipsFuture,
  );
});

class GravesScreenViewModel
    extends StateNotifier<AsyncValue<List<Grave>>> {
  GravesScreenViewModel({
    required Future<List<Grave>> graveRelationshipsFuture,
  }) : super(const AsyncLoading()) {
    _fetch(
      graveRelationshipsFuture: graveRelationshipsFuture,
    );
  }

  void _fetch({
    required Future<List<Grave>> graveRelationshipsFuture,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => graveRelationshipsFuture);
  }
}
