import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentRelativeRelationshipProvider = StreamProvider.family
    .autoDispose<Relative?, int>((ref, relationshipPersonID) async* {
  //get player id
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  //get relative relationship
  if (currentPlayerID != null) {
    final Stream<Relative?> relativeRelationshipStream =
        ref.watch(relationshipUsecasesProvider).watchRelativeUsecase.execute(
              mainPersonID: currentPlayerID,
              relativeID: relationshipPersonID,
            );

    await for (var relative in relativeRelationshipStream) {
      yield relative;
    }
  }

  yield null;
});
