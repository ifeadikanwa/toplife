import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final relativeRelationshipPairProvider = FutureProvider.family
    .autoDispose<RelationshipPair<Relative>?, int>(
        (ref, relationshipPersonID) async {
  //get player id
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  //get relative relationship
  if (currentPlayerID != null) {
    return ref
        .watch(relationshipUsecasesProvider)
        .getRelativeRelationshipPairUsecase
        .execute(
          mainPersonID: currentPlayerID,
          relativeID: relationshipPersonID,
        );
  }

  return null;
});
