import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/repository/pending_time_update_repository.dart';

class CreateOrUpdatePendingTimeUpdateUsecase {
  final PendingTimeUpdateRepository _pendingTimeUpdateRepository;

  const CreateOrUpdatePendingTimeUpdateUsecase(
      this._pendingTimeUpdateRepository);

  Future<PendingTimeUpdate> execute({
    required int gameId,
    required int timeInMinutes,
  }) async {
    //first check for pending update with game id

    final PendingTimeUpdate? existingPendingTimeUpdate =
        await _pendingTimeUpdateRepository.getPendingTimeUpdate(gameId);

    //if there is existing
    if (existingPendingTimeUpdate != null) {
      //new time
      final int newTime =
          existingPendingTimeUpdate.timeInMinutes + timeInMinutes;

      //update it
      return _pendingTimeUpdateRepository.createOrUpdatePendingTimeUpdate(
        existingPendingTimeUpdate.copyWith(timeInMinutes: newTime),
      );
    }

    //else create a new one
    else {
      final PendingTimeUpdate pendingTimeUpdate = PendingTimeUpdate(
        gameId: gameId,
        timeInMinutes: timeInMinutes,
      );
      //
      return _pendingTimeUpdateRepository.createOrUpdatePendingTimeUpdate(
        pendingTimeUpdate,
      );
    }
  }
}
