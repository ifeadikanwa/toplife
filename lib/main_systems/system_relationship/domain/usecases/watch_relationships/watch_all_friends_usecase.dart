import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/friend_repository.dart';

class WatchAllFriendsUsecase {
  final FriendRepository _friendRepository;

  WatchAllFriendsUsecase(this._friendRepository);

  Stream<List<Friend>> execute({required int mainPersonID}) {
    return _friendRepository.watchAllFriends(mainPersonID);
  }
}
