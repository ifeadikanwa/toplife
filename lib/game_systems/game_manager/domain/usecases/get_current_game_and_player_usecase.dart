import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/game_manager/domain/usecases/get_last_played_active_game_usecase.dart';
import 'package:toplife/game_systems/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';

class GetCurrentGameAndPlayerUsecase {
  final GetLastPlayedActiveGameUsecase _getLastPlayedActiveGameUsecase;
  final PersonUsecases _personUsecases;

  const GetCurrentGameAndPlayerUsecase(
    this._getLastPlayedActiveGameUsecase,
    this._personUsecases,
  );

  Future<PersonGamePair?> execute() async {
    //get current game = last played game
    //get the current player with the playerId

    final Game? currentGame = await _getLastPlayedActiveGameUsecase.execute();

    if (currentGame != null) {
      //check if it has a valid current player id
      final int? currentPlayerId = currentGame.currentPlayerID;

      if (currentPlayerId != null) {
        final Person? currentPlayer =
            await _personUsecases.getPersonUsecase.execute(
          personID: currentPlayerId,
        );

        //if person is valid, return the pair
        if (currentPlayer != null) {
          return PersonGamePair(
            person: currentPlayer,
            game: currentGame,
          );
        }
      }
    }

    return null;
  }
}
