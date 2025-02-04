import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';

part 'main_menu_screen_view_model.g.dart';

@riverpod
class MainMenuScreenViewModel extends _$MainMenuScreenViewModel {
  @override
  Future<Game?> build() async {
    //resolve all pending time updates here
    await ref
        .watch(gameUsecasesProvider)
        .resolveAllPendingTimeUpdatesUsecase
        .execute();

    //return last played game
    return ref
        .watch(gameUsecasesProvider)
        .getLastPlayedActiveGameUsecase
        .execute();
  }
}
