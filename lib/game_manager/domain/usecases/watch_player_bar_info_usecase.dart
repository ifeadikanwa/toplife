import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/core/utils/money/format_money_to_string.dart';
import 'package:toplife/game_manager/domain/model/info_models/player_bar_info.dart';
import 'package:toplife/game_manager/domain/usecases/watch_current_game_and_player_usecase.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class WatchPlayerBarInfoUsecase {
  final WatchCurrentGameAndPlayerUsecase _watchCurrentGameAndPlayerUsecase;
  final PersonUsecases _personUsecases;

  const WatchPlayerBarInfoUsecase(
    this._watchCurrentGameAndPlayerUsecase,
    this._personUsecases,
  );

  Stream<PlayerBarInfo> execute() async* {
    //watch the current game
    //watch the current player
    //populate the player bar info class
    //we'll use helper functions to deduce some information

    final currentGameAndPlayerStream =
        _watchCurrentGameAndPlayerUsecase.execute();

    await for (final currentGameAndPlayer in currentGameAndPlayerStream) {
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

        yield noGameAndPlayerInfo;
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
            currentGameAndPlayer.person.currentCountry,
          ),
          bankBalance: formatMoneyToString(currentBankBalance),
          time: getClockTime(
            timeInMinutes: currentGameAndPlayer.game.currentTimeInMinutes,
          ),
          day: currentGameAndPlayer.game.currentDay.toString(),
        );

        yield currentGameAndPlayerInfo;
      }
    }
  }
}
