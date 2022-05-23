import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:toplife/feature_game_manager/data/dao/game_dao_impl.dart';

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

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute(GameDaoImpl.createTableQuery);
  }

  Future closeDB() async {
    final db = await instance.database;

    db.close();
  }
}
