import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/friend_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/friend.dart';

class FriendDaoImpl implements FriendDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const friendTable = "friend";

  static const createTableQuery ="";
//       '''
//     CREATE TABLE $friendTable(
//       ${Friend.mainPersonIDColumn} $integerType,
//       ${Friend.friendIDColumn} $integerType,
//       ${Friend.metAtColumn} $textType,
//       ${Friend.haveRomanticRelationshipColumn} $boolType,
//       ${Friend.relationshipColumn} $integerType,
//       PRIMARY KEY (${Friend.mainPersonIDColumn}, ${Friend.friendIDColumn}),
//       FOREIGN KEY (${Friend.mainPersonIDColumn})
//        REFERENCES ${PersonDaoImpl.personTable} () 
//        ON UPDATE CASCADE
//        ON DELETE CASCADE,
//       FOREIGN KEY (${Friend.friendIDColumn})
//        REFERENCES ${PersonDaoImpl.personTable} () 
//        ON UPDATE CASCADE
//        ON DELETE CASCADE
//     )
// ''';

  @override
  Future<Friend> createFriend(Friend friend) async {
    final db = await _databaseProvider.database;
    await db.insert(
      friendTable,
      friend.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return friend;
  }

  @override
  Future<void> deleteFriend(int mainPersonID, int friendID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      friendTable,
      where:
          "${Friend.mainPersonIDColumn} = ? and ${Friend.friendIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        friendID,
      ],
    );
  }

  @override
  Future<List<Friend>> getAllFriends(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final friendsMap = await db.query(
      friendTable,
      columns: Friend.allColumns,
      where: "${Friend.mainPersonIDColumn} = ?",
      whereArgs: [mainPersonID],
    );

    return friendsMap
        .map((friendMap) => Friend.fromMap(friendMap: friendMap))
        .toList();
  }

  @override
  Future<Friend?> getFriend(int mainPersonID, int friendID) async {
    final db = await _databaseProvider.database;
    final friendsMap = await db.query(
      friendTable,
      columns: Friend.allColumns,
      where:
          "${Friend.mainPersonIDColumn} = ? and ${Friend.friendIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        friendID,
      ],
    );

    if (friendsMap.isNotEmpty) {
      return Friend.fromMap(friendMap: friendsMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateFriend(Friend friend) async {
    final db = await _databaseProvider.database;
    await db.update(
      friendTable,
      friend.toMap(),
      where:
          "${Friend.mainPersonIDColumn} = ? and ${Friend.friendIDColumn} = ?",
      whereArgs: [
        friend.mainPersonID,
        friend.friendID,
      ],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
