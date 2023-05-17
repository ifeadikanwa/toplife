import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/date_and_time/convert_hours_to_minutes.dart';
import 'package:toplife/core/utils/date_and_time/convert_minutes_to_truncated_hours.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/increase/sleep_usecase.dart';

final sleepActionDialogViewModelProvider =
    StateNotifierProvider.autoDispose<SleepActionDialogViewModel, Time>(
  (ref) => SleepActionDialogViewModel(
    ref.watch(personUsecasesProvider).sleepUsecase,
    ref.watch(gameUsecasesProvider),
  ),
);

class SleepActionDialogViewModel extends StateNotifier<Time> {
  final SleepUsecase _sleepUsecase;
  final GameUsecases _gameUsecases;
  SleepActionDialogViewModel(
    this._sleepUsecase,
    this._gameUsecases,
  ) : super(const Time(hours: 0, minutes: 0));

  void updateHours(int hoursInMinutes) {
    final Time oldTime = state;
    state = Time(
      hours: convertMinutesToTruncatedHours(hoursInMinutes),
      minutes: oldTime.minutes,
    );
  }

  void updateMinutes(int minutes) {
    final Time oldTime = state;
    state = Time(
      hours: oldTime.hours,
      minutes: minutes,
    );
  }

  Future<void> sleep({
    required BuildContext context,
    required Game currentGame,
  }) async {
    await _sleepUsecase.execute(
      personID: currentGame.currentPlayerID,
      gameID: currentGame.id,
      currentDay: currentGame.currentDay,
      activityDurationInMinutes: _getTotalTimeInMinutes(),
      gameUsecases: _gameUsecases,
      context: context,
    );
  }

  int _getTotalTimeInMinutes() {
    //convert the hours to minutes and add to the chosen minutes
    return convertHoursToMinutes(state.hours) + state.minutes;
  }
}
