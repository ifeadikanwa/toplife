import 'package:toplife/game_manager/domain/model/game.dart';
import 'package:toplife/game_manager/domain/usecases/get_last_played_active_game_usecase.dart';
import 'package:toplife/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

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

    final Game? currentGame =
        await _getLastPlayedActiveGameUsecase.execute();

    if (currentGame != null) {
      final Person? currentPlayer = await _personUsecases.getPersonUsecase.execute(
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
