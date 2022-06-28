import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_school/domain/dao/degree_dao.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';

class DegreeDaoImpl implements DegreeDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const degreeTable = "degree";

  static const createTableQuery = '''
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
    await db.insert(
      degreeTable,
      degree.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    //i dont update with id because the degree table has no copyWith method to avoid updating because it is a record tabe that the user cannot change.
    return degree;
  }

  @override
  Future<void> deleteDegreeTable() async {
    final db = await _databaseProvider.database;
    await db.delete(degreeTable);
  }

  @override
  Future<List<Degree>> getAllDegrees() async {
    final db = await _databaseProvider.database;
    final allDegreesMap = await db.query(
      degreeTable,
      columns: Degree.allColumns,
    );

    return allDegreesMap
        .map((degreeMap) => Degree.fromMap(degreeMap: degreeMap))
        .toList();
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
