import 'package:drift/drift.dart';
import 'package:toplife/game_manager/domain/repository/game_repository.dart';

class ChangeCurrentPlayerUsecase {
  final GameRepository _gameRepository;

  const ChangeCurrentPlayerUsecase({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  Future<void> execute(
      {required int gameID, required int newCurrentPlayerID}) async {
    //*This is for continuing a generation.
    //*The general idea is:
    //*Take the person the player has decide to continue as and then:
    //* - If they are not an adult yet:
    //*   >You need to progress life to the point where they become a young adult
    //*    (calculate the days till they become a young adult and make that the current day.)
    //*   >You need to process all the important events(only family events) in the event queue that are supposed
    //*    to happen before the day they become a young adult. e.g deaths, marriages, divorces etc
    //* - If they are already an adult:
    //*   >You resume their life on that current day and add a funeral event for the previous player to the event queue.
    //*   >Clear the event queue of events where the main person was a friend of the previous player.

    //temp implementation
    final game = await _gameRepository.getGame(gameID);

    if (game != null) {
      final updatedGame = game.copyWith(
        currentPlayerID: Value(newCurrentPlayerID),
      );

      _gameRepository.updateGame(updatedGame);
    }
  }
}
