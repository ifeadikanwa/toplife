import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/dao/stance_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/model/stance.dart';

class StanceDaoImpl implements StanceDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const stanceTable = "stance";

  static const createTableQuery = '''
    CREATE TABLE $stanceTable(
      ${Stance.idColumn} $idType,
      ${Stance.personIDColumn} $integerType $unique,
      ${Stance.openToAdoptionColumn} $boolType,
      ${Stance.openToAbortionColumn} $boolType,
      ${Stance.openToSurrogacyColumn} $boolType,
      ${Stance.openToAlternativeFertilityMethodsColumn} $boolType,
      ${Stance.openToSigningPrenupColumn} $boolType,
      ${Stance.wantsPartnerToSignPrenupColumn} $boolType,
      ${Stance.openToCrimesColumn} $boolType,
      ${Stance.openToStayAtHomeParentingColumn} $boolType,
      FOREIGN KEY (${Stance.personIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
  ''';

  @override
  Future<Stance> createStance(Stance stance) async {
    final db = await _databaseProvider.database;
    final id = await db.insert(
      stanceTable,
      stance.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return stance.copyWith(id: id);
  }

  @override
  Future<void> deleteStance(int stanceID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      stanceTable,
      where: "${Stance.idColumn} = ?",
      whereArgs: [stanceID],
    );
  }

  @override
  Future<Stance?> getStance(int personID) async {
    final db = await _databaseProvider.database;
    final stanceMaps = await db.query(
      stanceTable,
      columns: Stance.allColumns,
      where: "${Stance.personIDColumn} = ?",
      whereArgs: [personID],
    );

    if (stanceMaps.isNotEmpty) {
      return Stance.fromMap(stanceMap: stanceMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateStance(Stance stance) async {
    final db = await _databaseProvider.database;
    await db.update(
      stanceTable,
      stance.toMap(),
      where: "${Stance.idColumn} = ?",
      whereArgs: [stance.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
