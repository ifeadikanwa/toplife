import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentSiblingRelationshipProvider = StreamProvider.family
    .autoDispose<Sibling?, int>((ref, relationshipPersonID) async* {
  //get player id
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  //get sibling relationship
  if (currentPlayerID != null) {
    final Stream<Sibling?> siblingRelationshipStream =
        ref.watch(relationshipUsecasesProvider).watchSiblingUsecase.execute(
              mainPersonID: currentPlayerID,
              siblingID: relationshipPersonID,
            );

    await for (var sibling in siblingRelationshipStream) {
      yield sibling;
    }
  }

  yield null;
});
