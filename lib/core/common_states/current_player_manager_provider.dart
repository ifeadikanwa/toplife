import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/presentation/game_manager_provider.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

//provider
final currentPlayerManagerProvider =
    StateNotifierProvider<CurrentPlayerManager, AsyncValue<Person?>>((ref) {
  final Game? currentGame = ref.watch(gameManagerProvider).valueOrNull;
  final PersonUsecases personUsecases = ref.watch(personUsecasesProvider);

  return CurrentPlayerManager(
    currentGame,
    personUsecases,
  );
});

//Manager class
class CurrentPlayerManager extends StateNotifier<AsyncValue<Person?>> {
  final Game? _currentGame;
  final PersonUsecases _personUsecases;

  CurrentPlayerManager(
    this._currentGame,
    this._personUsecases,
  ) : super(const AsyncLoading()) {
    _fetch();
  }

  void _fetch() async {
    state = const AsyncLoading();

    //if current game is not null get current player, or else set as null.
    (_currentGame != null)
        ? state = await AsyncValue.guard(
            () => _personUsecases.getPersonUsecase.execute(
              personID: _currentGame!.currentPlayerID,
            ),
          )
        : state = await AsyncValue.guard(
            () async => null,
          );
  }
  
}
