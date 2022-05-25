import 'package:toplife/feature_game_manager/domain/model/game.dart';
import 'package:toplife/feature_game_manager/domain/repository/game_repository.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/create_adult_person_usecase.dart';

class CreateGameUsecase {
  final GameRepository _gameRepository;
  final CreateAdultPersonUsecase _createAdultPersonUsecase;

  const CreateGameUsecase({
    required GameRepository gameRepository,
    required CreateAdultPersonUsecase createAdultPersonUsecase,
  })  : _gameRepository = gameRepository,
        _createAdultPersonUsecase = createAdultPersonUsecase;

  Future<Game> execute(Person person) async {
    // ignore: todo
    //TODO: create mother, father and siblings

    final currentPlayer = await _createAdultPersonUsecase.execute(person);

    final game = Game(
      currentPlayerID: currentPlayer.id!,
      isActive: true,
      lastPlayedTime: DateTime.now().millisecondsSinceEpoch,
    );

    final createdGame = await _gameRepository.createGame(game);

    //todo: update the game id in the created player.

    return createdGame;
  }
}
