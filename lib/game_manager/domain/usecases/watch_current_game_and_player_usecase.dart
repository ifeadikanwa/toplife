import 'package:toplife/game_manager/domain/repository/game_repository.dart';
import 'package:toplife/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class WatchCurrentGameAndPlayerUsecase {
  final GameRepository _gameRepository;
  final PersonUsecases _personUsecases;

  const WatchCurrentGameAndPlayerUsecase(
    this._gameRepository,
    this._personUsecases,
  );

  Stream<PersonGamePair?> execute() async* {
    //watch current game = last played game
    //watch the current player with the playerId

    final currentGameStream = _gameRepository.watchLastPlayedActiveGame();

    await for (final currentGame in currentGameStream) {
      if (currentGame != null) {
        final currentPlayerStream = _personUsecases.watchPersonUsecase
            .execute(personID: currentGame.currentPlayerID);

        await for (final currentPlayer in currentPlayerStream) {
          if (currentPlayer != null) {
            yield PersonGamePair(
              person: currentPlayer,
              game: currentGame,
            );
          } else {
            yield null;
          }
        }
      } else {
        yield null;
      }
    }
  }
}
