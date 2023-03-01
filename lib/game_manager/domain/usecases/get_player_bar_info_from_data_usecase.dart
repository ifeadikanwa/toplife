import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/core/utils/money/format_money_to_string.dart';
import 'package:toplife/game_manager/domain/model/info_models/player_bar_info.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class GetPlayerBarInfoFromDataUsecase {
  final PersonUsecases _personUsecases;

  const GetPlayerBarInfoFromDataUsecase(
    this._personUsecases,
  );

  Future<PlayerBarInfo> execute({
    required Game? currentGame,
    required Person? currentPlayer,
  }) async {
    //use the current game and player passed in
    //populate the player bar info class
    //we'll use helper functions to deduce some information

    if (currentGame == null || currentPlayer == null) {
      const PlayerBarInfo noGameAndPlayerInfo = PlayerBarInfo(
        firstName: TextConstants.dash,
        lastName: TextConstants.dash,
        currency: TextConstants.dash,
        bankBalance: TextConstants.dash,
        time: TextConstants.dash,
        day: TextConstants.dash,
      );

      return noGameAndPlayerInfo;
    } else {
      final int currentBankBalance =
          await _personUsecases.getPlayerMoneyUsecase.execute(
        mainPlayerID: currentGame.currentPlayerID,
      );

      final PlayerBarInfo currentGameAndPlayerInfo = PlayerBarInfo(
        firstName: currentPlayer.firstName,
        lastName: currentPlayer.lastName,
        currency: LocationManager.getCountryCurrency(
          currentPlayer.currentCountry,
        ),
        bankBalance: formatMoneyToString(currentBankBalance),
        time: getClockTime(
          timeInMinutes: currentGame.currentTimeInMinutes,
        ),
        day: currentGame.currentDay.toString(),
      );

      return currentGameAndPlayerInfo;
    }
  }
}
