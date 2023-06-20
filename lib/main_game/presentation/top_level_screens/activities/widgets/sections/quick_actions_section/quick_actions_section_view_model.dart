import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/dialogs/sleep_action_dialog/sleep_action_dialog.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

final quickActionsSectionViewModelProvider =
    FutureProvider<QuickActionsSectionViewModel>(
  (ref) async => QuickActionsSectionViewModel(
    ref.watch(personUsecasesProvider),
    ref.watch(shopAndStorageUsecasesProvider),
    ref.watch(gameUsecasesProvider),
    await ref.watch(currentGameProvider.future),
  ),
);

//ViewModel
//handles no state, we create functions that get called in onTap
class QuickActionsSectionViewModel {
  final PersonUsecases _personUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final GameUsecases _gameUsecases;
  final Game? _currentGame;

  const QuickActionsSectionViewModel(
    this._personUsecases,
    this._shopAndStorageUsecases,
    this._gameUsecases,
    this._currentGame,
  );

  Future<void> quickEat(
    int activityDuration,
    BuildContext context,
  ) async {
    if (_currentGame != null) {
      await _personUsecases.quickEatUsecase.execute(
        mainPersonID: _currentGame!.currentPlayerID,
        gameID: _currentGame!.id,
        currentDay: _currentGame!.currentDay,
        activityDurationInMinutes: activityDuration,
        context: context,
        shopAndStorageUsecases: _shopAndStorageUsecases,
        gameUsecases: _gameUsecases,
      );
    }
  }

  void goToSleepActionDialog(BuildContext context) {
    if (_currentGame != null) {
      showDismissableDialog(
        context: context,
        child: SleepActionDialog(currentGame: _currentGame!),
      );
    }
  }
}
