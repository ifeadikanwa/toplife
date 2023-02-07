import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/core/utils/money/format_money_to_string.dart';
import 'package:toplife/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/game_manager/domain/model/info_models/player_bar_info.dart';
import 'package:toplife/game_manager/domain/usecases/get_current_game_and_player_usecase.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class GetPlayerBarInfoUsecase {
  final GetCurrentGameAndPlayerUsecase _getCurrentGameAndPlayerUsecase;
  final PersonUsecases _personUsecases;

  const GetPlayerBarInfoUsecase(
    this._getCurrentGameAndPlayerUsecase,
    this._personUsecases,
  );

  Future<PlayerBarInfo> execute() async {
    //get the current game
    //get the current player
    //populate the player bar info class
    //we'll use helper functions to deduce some information

    final PersonGamePair? currentGameAndPlayer =
        await _getCurrentGameAndPlayerUsecase.execute();

    //if no game and player is returned, do
    if (currentGameAndPlayer == null) {
      const PlayerBarInfo noGameAndPlayerInfo = PlayerBarInfo(
        firstName: TextConstants.dash,
        lastName: TextConstants.dash,
        currency: TextConstants.dash,
        bankBalance: TextConstants.dash,
        time: TextConstants.dash,
        day: TextConstants.dash,
      );

      return noGameAndPlayerInfo;
    }
    //if current game and player is returned
    else {
      final int currentBankBalance =
          await _personUsecases.getPlayerMoneyUsecase.execute(
        mainPlayerID: currentGameAndPlayer.game.currentPlayerID,
      );

      final PlayerBarInfo currentGameAndPlayerInfo = PlayerBarInfo(
        firstName: currentGameAndPlayer.person.firstName,
        lastName: currentGameAndPlayer.person.lastName,
        currency: LocationManager.getCountryCurrency(
          currentGameAndPlayer.person.country,
        ),
        bankBalance: formatMoneyToString(currentBankBalance),
        time: getClockTime(
          timeInMinutes: currentGameAndPlayer.game.currentTimeInMinutes,
        ),
        day: currentGameAndPlayer.game.currentDay.toString(),
      );

      return currentGameAndPlayerInfo;
    }
  }
}
