import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/relationship/players_relationships/current_player_children_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final currentPlayerLivingChildrenPairsProvider =
    FutureProvider<List<RelationshipPair<Child>>>((ref) async {
  final List<Child> allChildren =
      await ref.watch(currentPlayerChildrenProvider.future);

  return ref
      .watch(relationshipUsecasesProvider)
      .getChildRelationshipPairsFromChildrenUsecase
      .execute(
        children: allChildren,
        onlyLivingPeople: true,
      );
});
