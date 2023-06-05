import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentGraveRelationshipProvider = StreamProvider.family
    .autoDispose<Grave?, int>((ref, relationshipPersonID) async* {
  //get player id
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  //get grave relationship
  if (currentPlayerID != null) {
    final Stream<Grave?> graveRelationshipStream =
        ref.watch(relationshipUsecasesProvider).watchGraveUsecase.execute(
              mainPersonID: currentPlayerID,
              graveID: relationshipPersonID,
            );

    await for (var grave in graveRelationshipStream) {
      yield grave;
    }
  }

  yield null;
});
