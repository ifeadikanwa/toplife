import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_school/domain/dao/school_project_dao.dart';
import 'package:toplife/main_systems/system_school/domain/model/school_project.dart';

class SchoolProjectDaoImpl implements SchoolProjectDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const schoolProjectTable = "school_project";

  static const createTableQuery ="";
  //  '''
  //   CREATE TABLE $schoolProjectTable(
  //     ${SchoolProject.idColumn} $idType,
  //     ${SchoolProject.schoolIDColumn} $integerType,
  //     ${SchoolProject.semesterNumberColumn} $integerType,
  //     ${SchoolProject.mainPersonIDColumn} $integerType,
  //     ${SchoolProject.mainPersonContributionColumn} $integerType,
  //     ${SchoolProject.projectPartnerSchoolRelationshipIDColumn} $integerType,
  //     ${SchoolProject.projectPartnerContributionColumn} $integerType,
  //     ${SchoolProject.projectPartnerWillContributeColumn} $boolType,
  //     FOREIGN KEY (${SchoolProject.schoolIDColumn})
  //      REFERENCES ${SchoolDaoImpl.schoolTable} (${School.idColumn}) 
  //      ON UPDATE CASCADE
  //      ON DELETE CASCADE,
  //     FOREIGN KEY (${SchoolProject.mainPersonIDColumn})
  //      REFERENCES ${PersonDaoImpl.personTable} () 
  //      ON UPDATE CASCADE
  //      ON DELETE CASCADE,
  //     FOREIGN KEY (${SchoolProject.projectPartnerSchoolRelationshipIDColumn})
  //      REFERENCES ${SchoolRelationshipDaoImpl.schoolRelationshipTable} (${SchoolRelationship.idColumn}) 
  //      ON UPDATE CASCADE
  //      ON DELETE CASCADE
  //   )
  // ''';

  @override
  Future<SchoolProject> createSchoolProject(SchoolProject schoolProject) async {
    final db = await _databaseProvider.database;
    final id = await db.insert(
      schoolProjectTable,
      schoolProject.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return schoolProject.copyWith(id: id);
  }

  @override
  Future<void> deleteSchoolProject(int schoolProjectID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      schoolProjectTable,
      where: "${SchoolProject.idColumn} = ?",
      whereArgs: [schoolProjectID],
    );
  }

  @override
  Future<SchoolProject?> getActiveSchoolProject(
    int mainPersonID,
    int schoolID,
    int semesterNumber,
  ) async {
    final db = await _databaseProvider.database;
    final activeSchoolProjectsMap = await db.query(
      schoolProjectTable,
      columns: SchoolProject.allColumns,
      where:
          "${SchoolProject.mainPersonIDColumn} = ? and ${SchoolProject.schoolIDColumn} = ? and ${SchoolProject.semesterNumberColumn} = ?",
      whereArgs: [
        mainPersonID,
        schoolID,
        semesterNumber,
      ],
    );

    if (activeSchoolProjectsMap.isNotEmpty) {
      return SchoolProject.fromMap(
          schoolProjectMap: activeSchoolProjectsMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<List<SchoolProject>> getAllSchoolProjects(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final allSchoolProjectsMap = await db.query(
      schoolProjectTable,
      columns: SchoolProject.allColumns,
      where: "${SchoolProject.mainPersonIDColumn} = ?",
      whereArgs: [mainPersonID],
    );

    return allSchoolProjectsMap
        .map((schoolProjectMap) =>
            SchoolProject.fromMap(schoolProjectMap: schoolProjectMap))
        .toList();
  }

  @override
  Future<SchoolProject?> getSchoolProject(int schoolProjectID) async {
    final db = await _databaseProvider.database;
    final schoolProjectsMap = await db.query(
      schoolProjectTable,
      columns: SchoolProject.allColumns,
      where: "${SchoolProject.idColumn} = ?",
      whereArgs: [schoolProjectID],
    );

    if (schoolProjectsMap.isNotEmpty) {
      return SchoolProject.fromMap(schoolProjectMap: schoolProjectsMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateSchoolProject(SchoolProject schoolProject) async {
     final db = await _databaseProvider.database;
    await db.update(
      schoolProjectTable,
      schoolProject.toMap(),
      where: "${SchoolProject.idColumn} = ?",
      whereArgs: [schoolProject.id],
    );
  }
}
