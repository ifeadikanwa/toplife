import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/repository/game_repository.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class CreateNewGameUsecase {
  final GameRepository _gameRepository;
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final AgeUsecases _ageUsecases;

  const CreateNewGameUsecase({
    required GameRepository gameRepository,
    required PersonUsecases personUsecases,
    required RelationshipUsecases relationshipUsecases,
    required AgeUsecases ageUsecases,
  })  : _gameRepository = gameRepository,
        _personUsecases = personUsecases,
        _relationshipUsecases = relationshipUsecases,
        _ageUsecases = ageUsecases;

  Future<Game> execute(Person person) async {
    const newGameTime = 480; //8 AM
    const newGameDay = 1;
    const newGameGenerationNumber = 1;

    //edit the person passed to be a fresh young adult and attach to the game
    final youngAdultPerson = person.copyWith(
        dayOfBirth: _ageUsecases.getDayOfBirthFromDaysLivedUsecase.execute(
      currentDay: newGameDay,
      daysLived: Age.newYoungAdultDaysLived,
    ));

    //Create a new person for the new game.
    final currentPlayer = await _personUsecases.createAdultPersonUsecase
        .execute(person: youngAdultPerson);

    //Create a new game and register the new person as the main player.
    final game = Game(
      id: DatabaseConstants.dummyId,
      currentPlayerID: currentPlayer.id,
      isActive: true,
      lastPlayedTime: DateTime.now().millisecondsSinceEpoch,
      currentDay: newGameDay,
      currentTimeInMinutes: newGameTime,
      generation: newGameGenerationNumber,
    );

    final createdGame = await _gameRepository.createGame(game);

    //Now that we have a new game.
    //update the player with the gameID so they are attached to the current game.
    final updatedCurrentPlayer = currentPlayer.copyWith(gameId: createdGame.id);

    await _personUsecases.updatePersonUsecase
        .execute(person: updatedCurrentPlayer);

    //create players family
    await _relationshipUsecases.createNewPlayerFamilyUsecase.execute(
      _personUsecases,
      updatedCurrentPlayer,
      newGameDay,
    );

    return createdGame;
  }
}
