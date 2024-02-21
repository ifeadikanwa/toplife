import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';

import 'package:toplife/main_systems/system_relationship/data/dao/grave_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/parent_child_link_dao_impl.dart';

import 'package:toplife/main_systems/system_relationship/data/dao/relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/game_relationship_interactions.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

final relationshipRepositoriesProvider =
    Provider<RelationshipRepositories>((ref) {
  final database = ref.watch(databaseProvider);
  return RelationshipRepositories(
    parentChildLinkDao: ParentChildLinkDaoImpl(database),
    relationshipDao: RelationshipDaoImpl(database),
    graveDao: GraveDaoImpl(database),
  );
});

final relationshipUsecasesProvider = Provider<RelationshipUsecases>((ref) {
  return RelationshipUsecases(
    ref: ref,
  );
});

//game relationship interactions
final gameRelationshipInteractionsProvider =
    Provider<GameRelationshipInteractions>((ref) {
  return GameRelationshipInteractions(
    ref: ref,
  );
});
