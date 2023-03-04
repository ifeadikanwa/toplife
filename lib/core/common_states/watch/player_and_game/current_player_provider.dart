import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentPlayerProvider = StreamProvider<Person?>((ref) async* {
  //listen to current game provider for changes in currentPlayerID only
  final int? currentPlayerID = await ref.watch(
      currentGameProvider.selectAsync((game) => game?.currentPlayerID));

  if (currentPlayerID != null) {
    final currentPlayerStream = ref
        .watch(personUsecasesProvider)
        .watchPersonUsecase
        .execute(personID: currentPlayerID);

    await for (final player in currentPlayerStream) {
      yield player;
    }
  } else {
    yield null;
  }
});
