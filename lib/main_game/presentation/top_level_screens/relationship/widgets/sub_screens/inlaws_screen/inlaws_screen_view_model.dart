import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/relationship/current_player_living_inlaw_pairs_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/util/rearrange_inlaws_list.dart';

final inLawsScreenViewModelProvider = StateNotifierProvider<
    InLawsScreenViewModel, AsyncValue<List<RelationshipPair<InLaw>>>>((ref) {
  //get recent
  final inLawsRelationshipPairsFuture = ref.watch(
    currentPlayerLivingInLawPairsProvider.future,
  );

  return InLawsScreenViewModel(
    inLawsPairsFuture: inLawsRelationshipPairsFuture,
  );
});

class InLawsScreenViewModel
    extends StateNotifier<AsyncValue<List<RelationshipPair<InLaw>>>> {
  InLawsScreenViewModel({
    required Future<List<RelationshipPair<InLaw>>> inLawsPairsFuture,
  }) : super(const AsyncLoading()) {
    _fetch(
      inLawsPairsFuture: inLawsPairsFuture,
    );
  }

  void _fetch({
    required Future<List<RelationshipPair<InLaw>>> inLawsPairsFuture,
  }) async {
    state = const AsyncLoading();
    //get the raw
    final List<RelationshipPair<InLaw>> rawInLawPairs = await inLawsPairsFuture;
    //process it
    final List<RelationshipPair<InLaw>> finalInLawPairs =
        rearrangeInLawsList(rawInLawPairs);
    //save it
    state = await AsyncValue.guard(() async => finalInLawPairs);
  }
}
