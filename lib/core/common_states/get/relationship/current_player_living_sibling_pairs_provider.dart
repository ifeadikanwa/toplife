import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/relationship/players_relationships/current_player_siblings_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final currentPlayerLivingSiblingPairsProvider =
    FutureProvider<List<RelationshipPair<Sibling>>>((ref) async {
  final List<Sibling> allSiblings =
      await ref.watch(currentPlayerSiblingsProvider.future);

  return ref
      .watch(relationshipUsecasesProvider)
      .getSiblingRelationshipPairsFromSiblingsUsecase
      .execute(
        siblings: allSiblings,
        onlyLivingPeople: true,
      );
});
