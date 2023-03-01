import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';

final currentGameProvider = StreamProvider<Game?>((ref) async* {
  final currentGameStream = ref
      .watch(gameUsecasesProvider)
      .watchLastPlayedActiveGameUsecase
      .execute();

  await for (final game in currentGameStream) {
    yield game;
  }
});
