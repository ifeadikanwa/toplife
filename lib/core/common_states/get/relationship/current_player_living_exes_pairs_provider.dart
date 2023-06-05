import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/relationship/players_relationships/current_player_exes_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final currentPlayerLivingExesPairsProvider =
    FutureProvider<List<RelationshipPair<Partner>>>((ref) async {
  final List<Partner> allExes =
      await ref.watch(currentPlayerExesProvider.future);

  return ref
      .watch(relationshipUsecasesProvider)
      .getPartnerRelationshipPairsFromPartnersUsecase
      .execute(
        partners: allExes,
        onlyLivingPeople: true,
      );
});
