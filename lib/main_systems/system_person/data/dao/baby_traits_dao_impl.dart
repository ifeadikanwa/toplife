import 'package:sqflite/sql.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/dao/baby_traits_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/baby_traits.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

class BabyTraitsDaoImpl implements BabyTraitsDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const babyTraitsTable = "baby_traits";

  static const createTableQuery = '''
    CREATE TABLE $babyTraitsTable(
      ${BabyTraits.idColumn} $idType,
      ${BabyTraits.personIDColumn} $integerType $unique,
      ${BabyTraits.fussinessColumn} $integerType,
      ${BabyTraits.appetiteColumn} $integerType,
      FOREIGN KEY (${BabyTraits.personIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
  ''';

  @override
  Future<BabyTraits> createBabyTraits(BabyTraits babyTraits) async {
    final db = await _databaseProvider.database;
    final id = await db.insert(
      babyTraitsTable,
      babyTraits.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return babyTraits.copyWith(id: id);
  }

  @override
  Future<void> deleteBabyTraits(int babyTraitsID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      babyTraitsTable,
      where: "${BabyTraits.idColumn} = ?",
      whereArgs: [babyTraitsID],
    );
  }

  @override
  Future<BabyTraits?> getBabyTraits(int personID) async {
    final db = await _databaseProvider.database;
    final babyTraitsMaps = await db.query(
      babyTraitsTable,
      columns: BabyTraits.allColumns,
      where: "${BabyTraits.personIDColumn} = ?",
      whereArgs: [personID],
    );

    if (babyTraitsMaps.isNotEmpty) {
      return BabyTraits.fromMap(babyTraitsMap: babyTraitsMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateBabyTraits(BabyTraits babyTraits) async {
    final db = await _databaseProvider.database;
    await db.update(
      babyTraitsTable,
      babyTraits.toMap(),
      where: "${BabyTraits.idColumn} = ?",
      whereArgs: [babyTraits.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
