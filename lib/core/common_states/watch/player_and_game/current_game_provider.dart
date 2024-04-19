import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

part 'current_game_provider.g.dart';

@riverpod
Stream<Game?> currentGame(CurrentGameRef ref) async* {
  final currentGameStream = ref
      .watch(gameUsecasesProvider)
      .watchLastPlayedActiveGameUsecase
      .execute();

  await for (final game in currentGameStream) {
    yield game;
  }
}
