import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_person_usecase.dart';

class GetCurrentGameAndPlayerUsecase {
  final GameUsecases _gameUsecases;
  final GetPersonUsecase _getPersonUsecase;

  const GetCurrentGameAndPlayerUsecase(
    this._gameUsecases,
    this._getPersonUsecase,
  );

  Future<PersonGamePair?> execute() async {
    //get current game = last played game
    //get the current player with the playerId

    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    if (currentGame != null) {
      final Person? currentPlayer = await _getPersonUsecase.execute(
        personID: currentGame.currentPlayerID,
      );

      if (currentPlayer != null) {
        return PersonGamePair(
          person: currentPlayer,
          game: currentGame,
        );
      }
    }

    return null;
  }
}
