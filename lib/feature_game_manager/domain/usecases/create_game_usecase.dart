import 'package:toplife/feature_game_manager/domain/model/game.dart';
import 'package:toplife/feature_game_manager/domain/repository/game_repository.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class CreateGameUsecase {
  final GameRepository _gameRepository;
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;

  const CreateGameUsecase({
    required GameRepository gameRepository,
    required PersonUsecases personUsecases,
    required RelationshipUsecases relationshipUsecases,
  })  : _gameRepository = gameRepository,
        _personUsecases = personUsecases,
        _relationshipUsecases = relationshipUsecases;

  Future<Game> execute(Person person) async {
    const newGameTime = 480; //8 AM
    const newGameDay = 1;

    //Create a new person for the new game.
    final currentPlayer =
        await _personUsecases.createAdultPersonUsecase.execute(person: person);

    //Create a new game and register the new person as the main player.
    final game = Game(
      currentPlayerID: currentPlayer.id!,
      isActive: true,
      lastPlayedTime: DateTime.now().millisecondsSinceEpoch,
      currentDay: newGameDay,
      currentTimeInMinutes: newGameTime,
    );

    final createdGame = await _gameRepository.createGame(game);

    //Now that we have a new game.
    //update the player with the gameID so they are attached to the current game.
    final updatedCurrentPlayer = currentPlayer.copyWith(gameID: createdGame.id);

    await _personUsecases.updatePersonUsecase
        .execute(person: updatedCurrentPlayer);
    
    //create players family
    await _relationshipUsecases.createNewPlayerFamilyUsecase.execute(
      updatedCurrentPlayer,
      newGameDay,
    );

    return createdGame;
  }
}
