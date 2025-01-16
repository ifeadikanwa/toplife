import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/job/job_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

part 'current_active_employments_provider.g.dart';

@riverpod
Stream<List<Employment>> currentActiveEmployments(
  CurrentActiveEmploymentsRef ref,
) async* {
  //only watch for player ID change
  final int? currentPlayerID =
      await ref.watch(currentPlayerProvider.selectAsync(
    (currentPlayer) => currentPlayer?.id,
  ));

  //yield
  if (currentPlayerID != null) {
    final currentActiveEmploymentsStream = ref
        .watch(jobUsecasesProvider)
        .watchActiveEmploymentsUsecase
        .execute(personID: currentPlayerID);

    await for (final employments in currentActiveEmploymentsStream) {
      yield employments;
    }
  } else {
    yield [];
  }
}
