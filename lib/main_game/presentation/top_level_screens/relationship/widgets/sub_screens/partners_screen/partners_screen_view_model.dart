import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/relationship/current_player_living_active_partner_and_coparent_pairs_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final partnersScreenViewModelProvider = StateNotifierProvider<PartnersScreenViewModel,
    AsyncValue<List<RelationshipPair<Partner>>>>((ref) {
  //get recent
  final activePartnersAndCoparentsRelationshipPairsFuture = ref.watch(
    currentPlayerLivingActivePartnerAndCoparentPairsProvider.future,
  );

  return PartnersScreenViewModel(
    activePartnersAndCoparentsPairsFuture: activePartnersAndCoparentsRelationshipPairsFuture,
  );
});

class PartnersScreenViewModel
    extends StateNotifier<AsyncValue<List<RelationshipPair<Partner>>>> {
  PartnersScreenViewModel({
    required Future<List<RelationshipPair<Partner>>> activePartnersAndCoparentsPairsFuture,
  }) : super(const AsyncLoading()) {
    _fetch(
      activePartnersAndCoparentsPairsFuture: activePartnersAndCoparentsPairsFuture,
    );
  }

  void _fetch({
    required Future<List<RelationshipPair<Partner>>> activePartnersAndCoparentsPairsFuture,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => activePartnersAndCoparentsPairsFuture);
  }
}
