import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/repository/pending_time_update_repository.dart';
import 'package:toplife/game_manager/domain/usecases/move_time_forward_usecase.dart';

class ResolvePendingTimeUpdateForAGameUsecase {
  final PendingTimeUpdateRepository _pendingTimeUpdateRepository;
  final MoveTimeForwardUsecase _moveTimeForwardUsecase;

  const ResolvePendingTimeUpdateForAGameUsecase(
    this._pendingTimeUpdateRepository,
    this._moveTimeForwardUsecase,
  );

  Future<void> execute({
    required int gameId,
  }) async {
    //get  pending time update with the given game id
    final PendingTimeUpdate? pendingTimeUpdate =
        await _pendingTimeUpdateRepository.getPendingTimeUpdate(gameId);

    //if it exists and it isn't 0
    if (pendingTimeUpdate != null && pendingTimeUpdate.timeInMinutes != 0) {
      //update game time
      await _moveTimeForwardUsecase.execute(
        gameID: gameId,
        timeInMinutes: pendingTimeUpdate.timeInMinutes,
      );

      //reset the pending time update
      await _pendingTimeUpdateRepository.createOrUpdatePendingTimeUpdate(
        pendingTimeUpdate.copyWith(
          timeInMinutes: 0,
        ),
      );
    }
  }
}
