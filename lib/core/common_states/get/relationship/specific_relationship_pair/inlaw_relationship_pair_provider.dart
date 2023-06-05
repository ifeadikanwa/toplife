import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final inLawRelationshipPairProvider = FutureProvider.family
    .autoDispose<RelationshipPair<InLaw>?, int>(
        (ref, relationshipPersonID) async {
  //get player id
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  //get inLaw relationship
  if (currentPlayerID != null) {
    return ref
        .watch(relationshipUsecasesProvider)
        .getInLawRelationshipPairUsecase
        .execute(
          mainPersonID: currentPlayerID,
          inLawID: relationshipPersonID,
        );
  }

  return null;
});
