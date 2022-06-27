import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:toplife/game_manager/data/dao/game_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/baby_traits_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/relationship_traits_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stance_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stats_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/acquaintance_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/child_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/friend_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/parent_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/partner_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/sibling_dao_impl.dart';

class DatabaseProvider {
  static final DatabaseProvider instance = DatabaseProvider._init();

  DatabaseProvider._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB("game.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      onConfigure: _onConfigure,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    //Game
    await db.execute(GameDaoImpl.createTableQuery);

    //Person
    await db.execute(PersonDaoImpl.createTableQuery);
    await db.execute(StatsDaoImpl.createTableQuery);
    await db.execute(BabyTraitsDaoImpl.createTableQuery);
    await db.execute(RelationshipTraitsDaoImpl.createTableQuery);
    await db.execute(StanceDaoImpl.createTableQuery);

    //Relationships
    await db.execute(ParentDaoImpl.createTableQuery);
    await db.execute(ChildDaoImpl.createTableQuery);
    await db.execute(SiblingDaoImpl.createTableQuery);
    await db.execute(PartnerDaoImpl.createTableQuery);
    await db.execute(FriendDaoImpl.createTableQuery);
    await db.execute(AcquaintanceDaoImpl.createTableQuery);
  }

  Future<void> _onConfigure(Database db) async {
    // Add support for foriegn keys
    await db.execute("PRAGMA foreign_keys = ON");
  }

  Future closeDB() async {
    final db = await instance.database;

    db.close();
  }
}
