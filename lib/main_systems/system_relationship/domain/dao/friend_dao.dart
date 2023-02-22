import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class FriendDao {
  Future<Friend> createFriend(Friend friend);
  Future<void> updateFriend(Friend friend);
  Future<List<Friend>> getAllFriends(int mainPersonID);
  Future<Friend?> getFriend(int mainPersonID, int friendID);
  Future<void> deleteFriend(int mainPersonID, int friendID);
  Stream<Friend?> watchFriend(int mainPersonID, int friendID);
  Stream<List<Friend>> watchAllFriends(int mainPersonID);
}
