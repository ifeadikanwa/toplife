import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_school/data/dao/degree_dao_impl.dart';
import 'package:toplife/main_systems/system_school/domain/dao/school_dao.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';

class SchoolDaoImpl implements SchoolDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const schoolTable = "school";

  static const createTableQuery = '''
    CREATE TABLE $schoolTable(
      ${School.idColumn} $idType,
      ${School.mainPersonIDColumn} $integerType,
      ${School.gradesColumn} $integerType,
      ${School.attendanceColumn} $integerType,
      ${School.projectColumn} $integerType,
      ${School.examColumn} $integerType,
      ${School.classStartTimeColumn} $integerType,
      ${School.classEndTimeColumn} $integerType,
      ${School.totalSemesterNumberColumn} $integerType,
      ${School.currentSemesterNumberColumn} $integerType,
      ${School.schoolTypeColumn} $textType,
      ${School.semesterStartDayColumn} $integerType,
      ${School.degreeIDColumn} $integerType,
      ${School.degreeLevelColumn} $textType,
      ${School.isActiveColumn} $boolType,
      ${School.isCompletedColumn} $boolType,
      ${School.wasExpelledColumn} $boolType,
      ${School.countryColumn} $textType,
      FOREIGN KEY (${School.mainPersonIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE,
      FOREIGN KEY (${School.degreeIDColumn})
       REFERENCES ${DegreeDaoImpl.degreeTable} (${Degree.idColumn}) 
       ON UPDATE NO ACTION
       ON DELETE NO ACTION
      )
  ''';

  @override
  Future<School> createSchool(School school) async {
    final db = await _databaseProvider.database;
    final id = await db.insert(
      schoolTable,
      school.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return school.copyWith(id: id);
  }

  @override
  Future<void> deleteSchool(int schoolID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      schoolTable,
      where: "${School.idColumn} = ?",
      whereArgs: [schoolID],
    );
  }

  @override
  Future<School?> getActiveSchool(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final allActiveSchoolsMap = await db.query(
      schoolTable,
      columns: School.allColumns,
      where: "${School.isActiveColumn} = ?",
      whereArgs: [databaseTrueValue],
      orderBy: "${School.idColumn} DESC",
    );

    if (allActiveSchoolsMap.isNotEmpty) {
      return School.fromMap(schoolMap: allActiveSchoolsMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<List<School>> getAllSchools(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final allSchoolsMap = await db.query(
      schoolTable,
      columns: School.allColumns,
    );

    return allSchoolsMap
        .map((schoolMap) => School.fromMap(schoolMap: schoolMap))
        .toList();
  }

  @override
  Future<School?> getSchool(int schoolID) async {
    final db = await _databaseProvider.database;
    final schoolsMap = await db.query(
      schoolTable,
      columns: School.allColumns,
      where: "${School.idColumn} = ?",
      whereArgs: [schoolID],
    );

    if (schoolsMap.isNotEmpty) {
      return School.fromMap(schoolMap: schoolsMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateSchool(School school) async {
    final db = await _databaseProvider.database;
    await db.update(
      schoolTable,
      school.toMap(),
      where: "${School.idColumn} = ?",
      whereArgs: [school.id],
    );
  }

  @override
  Future<List<School>> getAllCompletedSchool(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final allCompletedSchoolsMap = await db.query(
      schoolTable,
      columns: School.allColumns,
      where: "${School.mainPersonIDColumn} = ? and ${School.isCompletedColumn} = ? and ${School.isActiveColumn} = ?",
      whereArgs: [
        mainPersonID,
        databaseTrueValue,
        databaseFalseValue,
      ],
      orderBy: "${School.idColumn} DESC",
    );

    return allCompletedSchoolsMap
        .map((schoolMap) => School.fromMap(schoolMap: schoolMap))
        .toList();
  }
  
  @override
  Future<List<School>> getAllCompletedSchoolForADegree(int mainPersonID, int degreeID) async {
     final db = await _databaseProvider.database;
    final allCompletedSchoolsForADegreeMap = await db.query(
      schoolTable,
      columns: School.allColumns,
      where: "${School.mainPersonIDColumn} = ? and ${School.isCompletedColumn} = ? and ${School.degreeIDColumn} and ${School.isActiveColumn} = ?",
      whereArgs: [
        mainPersonID,
        databaseTrueValue,
        degreeID,
        databaseFalseValue,
      ],
      orderBy: "${School.idColumn} DESC",
    );

    return allCompletedSchoolsForADegreeMap
        .map((schoolMap) => School.fromMap(schoolMap: schoolMap))
        .toList();
  }
}
