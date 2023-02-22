import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/friend_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/friend.dart';

part 'friend_dao_impl.g.dart';

@DriftAccessor(tables: [FriendTable])
class FriendDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$FriendDaoImplMixin
    implements FriendDao {
  FriendDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Friend> createFriend(Friend friend) async {
    await into(friendTable).insertOnConflictUpdate(friend);
    return friend;
  }

  @override
  Future<void> deleteFriend(int mainPersonID, int friendID) {
    return (delete(friendTable)
          ..where(
            (friend) =>
                friend.mainPersonId.equals(mainPersonID) &
                friend.friendId.equals(friendID),
          ))
        .go();
  }

  @override
  Future<List<Friend>> getAllFriends(int mainPersonID) {
    return (select(friendTable)
          ..where(
            (friend) => friend.mainPersonId.equals(mainPersonID),
          ))
        .get();
  }

  @override
  Future<Friend?> getFriend(int mainPersonID, int friendID) {
    return (select(friendTable)
          ..where(
            (friend) =>
                friend.mainPersonId.equals(mainPersonID) &
                friend.friendId.equals(friendID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateFriend(Friend friend) {
    return update(friendTable).replace(friend);
  }

  @override
  Stream<Friend?> watchFriend(int mainPersonID, int friendID) {
    return (select(friendTable)
          ..where(
            (friend) =>
                friend.mainPersonId.equals(mainPersonID) &
                friend.friendId.equals(friendID),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<List<Friend>> watchAllFriends(int mainPersonID) {
    return (select(friendTable)
          ..where(
            (friend) => friend.mainPersonId.equals(mainPersonID),
          ))
        .watch();
  }
}
