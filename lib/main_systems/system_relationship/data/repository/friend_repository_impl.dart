import 'package:toplife/main_systems/system_relationship/domain/dao/friend_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/friend.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/friend_repository.dart';

class FriendRepositoryImpl implements FriendRepository {
  final FriendDao _friendDao;

  const FriendRepositoryImpl({required FriendDao friendDao}) : _friendDao = friendDao;

  @override
  Future<Friend> createFriend(Friend friend) async {
    return _friendDao.createFriend(friend);
  }

  @override
  Future<void> deleteFriend(int mainPersonID, int friendID) async {
    return _friendDao.deleteFriend(mainPersonID, friendID);
  }

  @override
  Future<List<Friend>> getAllFriends(int mainPersonID) async {
    return _friendDao.getAllFriends(mainPersonID);
  }

  @override
  Future<Friend?> getFriend(int mainPersonID, int friendID) async {
    return _friendDao.getFriend(mainPersonID, friendID);
  }

  @override
  Future<void> updateFriend(Friend friend) async {
    return _friendDao.updateFriend(friend);
  }
}
