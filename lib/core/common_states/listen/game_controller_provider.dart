import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final gameControllerProvider = Provider<void>((ref) {
  //listen for changes in game
  ref.listen(currentGameProvider.future, (
    Future<Game?>? previousGameFuture,
    Future<Game?> nextGameFuture,
  ) async {
    if (previousGameFuture != null) {
      //get the data
      final Game? previousGame = await previousGameFuture;
      final Game? nextGame = await nextGameFuture;

      //check if both are valid
      if (previousGame != null && nextGame != null) {
        //check if the time has changed
        if (previousGame.currentDay != nextGame.currentDay ||
            previousGame.currentTimeInMinutes !=
                nextGame.currentTimeInMinutes) {
          //call the game controller
          ref.watch(gameUsecasesProvider).gameControllerUsecase.execute(
                oldGame: previousGame,
                newGame: nextGame,
              );
        }
      }
    }
  });
});
