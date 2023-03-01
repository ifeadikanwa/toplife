import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';

final currentPlayerProvider = StreamProvider<Person?>((ref) async* {
  //listen to current game provider for changes in currentPlayerID only
  final int? currentPlayerID = await ref.watch(
      fetchCurrentGameProvider.selectAsync((game) => game?.currentPlayerID));

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
