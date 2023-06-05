import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentPlayerGravesProvider = StreamProvider<List<Grave>>((ref) async* {
  //only watch for player ID change
  final int? currentPlayerID =
      await ref.watch(currentPlayerProvider.selectAsync(
    (currentPlayer) => currentPlayer?.id,
  ));

  //yield
  if (currentPlayerID != null) {
    final currentPlayerGravesStream = ref
        .watch(relationshipUsecasesProvider)
        .watchAllGravesUsecase
        .execute(mainPersonID: currentPlayerID);

    await for (final graves in currentPlayerGravesStream) {
      yield graves;
    }
  } else {
    yield [];
  }
});
