import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentPlayerRelativesProvider = StreamProvider<List<Relative>>((ref) async* {
  //only watch for player ID change
  final int? currentPlayerID =
      await ref.watch(currentPlayerProvider.selectAsync(
    (currentPlayer) => currentPlayer?.id,
  ));

  //yield
  if (currentPlayerID != null) {
    final currentPlayerRelativesStream = ref
        .watch(relationshipUsecasesProvider)
        .watchAllRelativesUsecase
        .execute(mainPersonID: currentPlayerID);

    await for (final relatives in currentPlayerRelativesStream) {
      yield relatives;
    }
  } else {
    yield [];
  }
});
