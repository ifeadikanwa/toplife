import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:toplife/game_manager/data/dao/game_dao_impl.dart';
import 'package:toplife/main_systems/system_event/data/dao/event_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/dao/employment_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/dao/job_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/dao/job_relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_journal/data/dao/journal_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/baby_traits_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/relationship_traits_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stance_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stats_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/acquaintance_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/child_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/friend_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/graveyard_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/inlaw_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/parent_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/partner_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/relative_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/sibling_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/degree_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_project_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/car_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/food_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/fridge_food_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/house_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/item_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/jewelry_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/storeroom_item_dao_impl.dart';

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
    await db.execute(RelativeDaoImpl.createTableQuery);
    await db.execute(InLawDaoImpl.createTableQuery);
    await db.execute(GraveyardDaoImpl.createTableQuery);
    //School
    await db.execute(SchoolDaoImpl.createTableQuery);
    await db.execute(SchoolProjectDaoImpl.createTableQuery);
    await db.execute(SchoolRelationshipDaoImpl.createTableQuery);
    await db.execute(DegreeDaoImpl.createTableQuery);

    //Job
    await db.execute(JobDaoImpl.createTableQuery);
    await db.execute(EmploymentDaoImpl.createTableQuery);
    await db.execute(JobRelationshipDaoImpl.createTableQuery);

    //Shop & Storage
    await db.execute(FoodDaoImpl.createTableQuery);
    await db.execute(FridgeFoodDaoImpl.createTableQuery);
    await db.execute(ItemDaoImpl.createTableQuery);
    await db.execute(StoreroomItemDaoImpl.createTableQuery);
    await db.execute(HouseDaoImpl.createTableQuery);
    await db.execute(JewelryDaoImpl.createTableQuery);
    await db.execute(CarDaoImpl.createTableQuery);

    //Event
    await db.execute(EventDaoImpl.createTableQuery);

    //Journal
    await db.execute(JournalDaoImpl.createTableQuery);
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
