import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentChildRelationshipProvider = StreamProvider.family
    .autoDispose<Child?, int>((ref, relationshipPersonID) async* {
  //get player id
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  //get child relationship
  if (currentPlayerID != null) {
    final Stream<Child?> childRelationshipStream =
        ref.watch(relationshipUsecasesProvider).watchChildUsecase.execute(
              mainPersonID: currentPlayerID,
              childID: relationshipPersonID,
            );

    await for (var child in childRelationshipStream) {
      yield child;
    }
  }

  yield null;
});
