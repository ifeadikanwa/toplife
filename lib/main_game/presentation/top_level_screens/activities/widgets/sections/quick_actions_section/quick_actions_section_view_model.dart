import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

part 'quick_actions_section_view_model.g.dart';

@riverpod
class QuickActionsSectionViewModel extends _$QuickActionsSectionViewModel {
  @override
  void build() {}

  Future<void> quickEat(
    int activityDuration,
  ) async {
    //if game and current player id is valid

    //if we have a valid current game
    final Game? currentGame = await ref.read(currentGameProvider.future);

    if (currentGame != null && currentGame.currentPlayerID != null) {
      await ref.read(personUsecasesProvider).quickEatUsecase.execute(
            mainPersonID: currentGame.currentPlayerID!,
            gameID: currentGame.id,
            currentDay: currentGame.currentDay,
            activityDurationInMinutes: activityDuration,
          );
    }
  }
}
