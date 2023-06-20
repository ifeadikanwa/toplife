import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/acquaintance_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/child_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/friend_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/grave_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/inlaw_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/parent_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/partner_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/relative_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/sibling_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/game_relationship_interactions.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

final relationshipRepositoriesProvider =
    Provider<RelationshipRepositories>((ref) {
  final database = ref.watch(databaseProvider);
  return RelationshipRepositories(
    parentDao: ParentDaoImpl(database),
    childDao: ChildDaoImpl(database),
    siblingDao: SiblingDaoImpl(database),
    partnerDao: PartnerDaoImpl(database),
    friendDao: FriendDaoImpl(database),
    acquaintanceDao: AcquaintanceDaoImpl(database),
    relativeDao: RelativeDaoImpl(database),
    inLawDao: InLawDaoImpl(database),
    graveDao: GraveDaoImpl(database),
  );
});

final relationshipUsecasesProvider = Provider<RelationshipUsecases>((ref) {
  return RelationshipUsecases(
    relationshipRepositories: ref.watch(relationshipRepositoriesProvider),
    personUsecases: ref.watch(personUsecasesProvider),
  );
});

//game relationship interactions
final gameRelationshipInteractionsProvider =
    Provider<GameRelationshipInteractions>((ref) {
  return GameRelationshipInteractions(
    ref.watch(relationshipUsecasesProvider),
    ref.watch(journalUsecasesProvider),
    ref.watch(personUsecasesProvider),
    ref.watch(shopAndStorageUsecasesProvider),
  );
});
