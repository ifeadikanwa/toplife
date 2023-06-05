import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/friend_repository.dart';

class WatchFriendUsecase {
  final FriendRepository _friendRepository;

  const WatchFriendUsecase(this._friendRepository);

  Stream<Friend?> execute({
    required int mainPersonID,
    required int friendID,
  }) {
    return _friendRepository.watchFriend(mainPersonID, friendID);
  }
}
