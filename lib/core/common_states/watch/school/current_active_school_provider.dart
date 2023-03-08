import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/school/school_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentActiveSchoolProvider = StreamProvider<School?>((ref) async* {
  //only watch for player ID change
  final int? currentPlayerID =
      await ref.watch(currentPlayerProvider.selectAsync(
    (currentPlayer) => currentPlayer?.id,
  ));

  //yield
  if (currentPlayerID != null) {
    final currentActiveSchoolStream = ref
        .watch(schoolUsecasesProvider)
        .watchActiveSchoolUsecase
        .execute(mainPersonID: currentPlayerID);

    await for (final school in currentActiveSchoolStream) {
      yield school;
    }
  } else {
    yield null;
  }
});
