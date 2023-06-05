import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentParentRelationshipProvider = StreamProvider.family
    .autoDispose<Parent?, int>((ref, relationshipPersonID) async* {
  //get player id
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  //get parent relationship
  if (currentPlayerID != null) {
    final Stream<Parent?> parentRelationshipStream =
        ref.watch(relationshipUsecasesProvider).watchParentUsecase.execute(
              mainPersonID: currentPlayerID,
              parentID: relationshipPersonID,
            );

    await for (var parent in parentRelationshipStream) {
      yield parent;
    }
  }

  yield null;
});
