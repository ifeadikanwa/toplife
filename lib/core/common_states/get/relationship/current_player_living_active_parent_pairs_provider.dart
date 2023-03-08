import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/relationship/current_player_active_parents_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final currentPlayerLivingActiveParentPairsProvider =
    FutureProvider<List<RelationshipPair<Parent>>>((ref) async {
  final List<Parent> allParents =
      await ref.watch(currentPlayerActiveParentsProvider.future);

  return ref
      .watch(relationshipUsecasesProvider)
      .getParentRelationshipPairsFromParentsUsecase
      .execute(
        parents: allParents,
        onlyLivingPeople: true,
      );
});
