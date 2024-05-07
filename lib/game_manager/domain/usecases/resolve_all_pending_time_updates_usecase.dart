import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/repository/pending_time_update_repository.dart';
import 'package:toplife/game_manager/domain/usecases/move_time_forward_usecase.dart';

class ResolveAllPendingTimeUpdatesUsecase {
  final PendingTimeUpdateRepository _pendingTimeUpdateRepository;
  final MoveTimeForwardUsecase _moveTimeForwardUsecase;

  const ResolveAllPendingTimeUpdatesUsecase(
    this._pendingTimeUpdateRepository,
    this._moveTimeForwardUsecase,
  );

  Future<void> execute() async {
    //get all pending updates
    final List<PendingTimeUpdate> allPendingTimeUpdates =
        await _pendingTimeUpdateRepository.getAllPendingTimeUpdates();

    //loop through all pending
    for (var pendingTimeUpdate in allPendingTimeUpdates) {
      //if time update isn't 0
      if (pendingTimeUpdate.timeInMinutes != 0) {
        //update game time
        await _moveTimeForwardUsecase.execute(
          gameID: pendingTimeUpdate.gameId,
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
}
