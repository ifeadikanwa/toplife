import 'package:toplife/main_systems/system_relationship/domain/model/friend.dart';

abstract class FriendDao {
  Future<Friend> createFriend(Friend friend);
  Future<void> updateFriend(Friend friend);
  Future<List<Friend>> getAllFriends(int mainPersonID);
  Future<Friend?> getFriend(int mainPersonID, int friendID);
  Future<void> deleteFriend(int mainPersonID, int friendID);
}
