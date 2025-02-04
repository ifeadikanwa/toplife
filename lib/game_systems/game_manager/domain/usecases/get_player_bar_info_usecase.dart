import 'package:toplife/game_systems/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/game_systems/game_manager/domain/model/info_models/player_bar_info.dart';
import 'package:toplife/game_systems/game_manager/domain/usecases/get_current_game_and_player_usecase.dart';
import 'package:toplife/game_systems/game_manager/domain/usecases/get_player_bar_info_from_data_usecase.dart';

class GetPlayerBarInfoUsecase {
  final GetCurrentGameAndPlayerUsecase _getCurrentGameAndPlayerUsecase;
  final GetPlayerBarInfoFromDataUsecase _getPlayerBarInfoFromDataUsecase;

  const GetPlayerBarInfoUsecase(
    this._getCurrentGameAndPlayerUsecase,
    this._getPlayerBarInfoFromDataUsecase,
    );

  Future<PlayerBarInfo> execute() async {
    //get the current game
    //get the current player
    //populate the player bar info class
    //we'll use helper functions to deduce some information

    final PersonGamePair? currentGameAndPlayer =
        await _getCurrentGameAndPlayerUsecase.execute();

    return _getPlayerBarInfoFromDataUsecase.execute(
      currentGame: currentGameAndPlayer?.game,
      currentPlayer: currentGameAndPlayer?.person,
    );
  }
}
