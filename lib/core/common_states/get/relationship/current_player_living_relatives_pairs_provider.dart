import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/relationship/players_relationships/current_player_relatives_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final currentPlayerLivingRelativePairsProvider =
    FutureProvider<List<RelationshipPair<Relative>>>((ref) async {
  final List<Relative> allRelatives =
      await ref.watch(currentPlayerRelativesProvider.future);

  return ref
      .watch(relationshipUsecasesProvider)
      .getRelativeRelationshipPairsFromRelativesUsecase
      .execute(
        relatives: allRelatives,
        onlyLivingPeople: true,
      );
});
