import 'package:toplife/feature_game_manager/domain/model/game.dart';
import 'package:toplife/feature_game_manager/domain/repository/game_repository.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class CreateGameUsecase {
  final GameRepository _gameRepository;
  final PersonUsecases _personUsecases;

  const CreateGameUsecase({
    required GameRepository gameRepository,
    required PersonUsecases personUsecases,
  })  : _gameRepository = gameRepository,
        _personUsecases = personUsecases;

  Future<Game> execute(Person person) async {
    // ignore: todo
    //TODO: create mother, father and siblings

    //Create a new person for the new game.
    final currentPlayer =
        await _personUsecases.createAdultPersonUsecase.execute(person: person);

    //Create a new game and register the new person as the main player.
    final game = Game(
      currentPlayerID: currentPlayer.id!,
      isActive: true,
      lastPlayedTime: DateTime.now().millisecondsSinceEpoch,
      currentDay: 1,
      currentTimeInMinutes: 480, //8 AM
    );

    final createdGame = await _gameRepository.createGame(game);

    //Now that we have a new game.
    //update the player with the gameID so they are attached to the current game.
    final updatedCurrentPlayer = currentPlayer.copyWith(gameID: createdGame.id);
    
    await _personUsecases.updatePersonUsecase
        .execute(person: updatedCurrentPlayer);

    return createdGame;
  }
}
