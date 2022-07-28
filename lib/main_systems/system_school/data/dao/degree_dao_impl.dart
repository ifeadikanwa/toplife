import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_school/domain/dao/degree_dao.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';

class DegreeDaoImpl implements DegreeDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const degreeTable = "degree";

  static const createTableQuery =
      '''
    CREATE TABLE $degreeTable(
      ${Degree.idColumn} $idType,
      ${Degree.disciplineColumn} $textType,
      ${Degree.branchColumn} $textType,
      ${Degree.isSpecialDegreeColumn} $boolType
    )
''';

  @override
  Future<Degree> createDegree(Degree degree) async {
    final db = await _databaseProvider.database;
    final int id = await db.insert(
      degreeTable,
      degree.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return degree.copyWith(id: id);
  }

  @override
  Future<Degree?> getDegree(int degreeID) async {
    final db = await _databaseProvider.database;
    final degreeMaps = await db.query(
      degreeTable,
      columns: Degree.allColumns,
      where: "${Degree.idColumn} = ?",
      whereArgs: [degreeID],
    );

    if (degreeMaps.isNotEmpty) {
      return Degree.fromMap(degreeMap: degreeMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<Degree?> findDegreeWithDegreeDisciplineAndBranch({
    required String degreeDiscipline,
    required String degreeBranch,
  }) async {
    final db = await _databaseProvider.database;
    final degreeMaps = await db.query(
      degreeTable,
      columns: Degree.allColumns,
      where: "${Degree.disciplineColumn} = ? and ${Degree.branchColumn} = ?",
      whereArgs: [
        degreeDiscipline,
        degreeBranch,
      ],
    );

    if (degreeMaps.isNotEmpty) {
      return Degree.fromMap(degreeMap: degreeMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateDegree(Degree degree) async {
    final db = await _databaseProvider.database;
    await db.update(
      degreeTable,
      degree.toMap(),
      where: "${Degree.idColumn} = ?",
      whereArgs: [degree.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
