import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/date_and_time/day_and_minutes.dart';
import 'package:toplife/core/utils/date_and_time/get_minutes_between_two_times.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';
import 'package:toplife/game_manager/domain/usecases/control_game/decay_and_alter_player_stats_usecase.dart';

class GameControllerUsecase {
  final DecayAndAlterPlayerStatsUsecase _decayAndAlterPlayerStatsUsecase;

  const GameControllerUsecase(
    this._decayAndAlterPlayerStatsUsecase,
  );

  Future<void> execute({
    required Game oldGame,
    required Game newGame,
  }) async {

    //get hours passed
    final int totalMinutesPassed = getMinutesBetweenTwoTimes(
        startTime: DayAndMinutes(
          day: oldGame.currentDay,
          minutes: oldGame.currentTimeInMinutes,
          isNewDay: false,
        ),
        endTime: DayAndMinutes(
          day: newGame.currentDay,
          minutes: newGame.currentTimeInMinutes,
          isNewDay: false,
        ));
    //get the absolute value to be completely error proof
    final double hoursPassed =
        (totalMinutesPassed / Time.minutesInAnHour).abs();

    //Alter player stats
    await _decayAndAlterPlayerStatsUsecase.execute(
      playerID: newGame.currentPlayerID,
      hoursPassed: hoursPassed,
    );

    //run scheduled events
    
  }
}
