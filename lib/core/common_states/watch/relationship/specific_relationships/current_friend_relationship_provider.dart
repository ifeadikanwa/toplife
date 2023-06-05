import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentFriendRelationshipProvider = StreamProvider.family
    .autoDispose<Friend?, int>((ref, relationshipPersonID) async* {
  //get player id
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  //get friend relationship
  if (currentPlayerID != null) {
    final Stream<Friend?> friendRelationshipStream =
        ref.watch(relationshipUsecasesProvider).watchFriendUsecase.execute(
              mainPersonID: currentPlayerID,
              friendID: relationshipPersonID,
            );

    await for (var friend in friendRelationshipStream) {
      yield friend;
    }
  }

  yield null;
});
