import 'package:toplife/core/utils/date_and_time/add_time.dart';
import 'package:toplife/core/utils/date_and_time/day_and_minutes.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/repository/game_repository.dart';

class MoveTimeForwardUsecase {
  final GameRepository _gameRepository;

  const MoveTimeForwardUsecase({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  Future<void> execute({
    required int gameID,
    required int timeInMinutes,
  }) async {
    final Game? game = await _gameRepository.getGame(
      gameID,
    );

    if (game != null) {
      final DayAndMinutes newTime = addTime(
        currentDay: game.currentDay,
        currentTimeInMinutes: game.currentTimeInMinutes,
        timeToAddInMinutes: timeInMinutes,
      );
      _gameRepository.updateGame(
        game.copyWith(
          currentDay: newTime.day,
          currentTimeInMinutes: newTime.minutes,
        ),
      );
    }
  }
}
