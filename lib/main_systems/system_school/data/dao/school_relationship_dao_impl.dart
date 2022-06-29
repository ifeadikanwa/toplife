import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_school/constants/school_relationship_type.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_dao_impl.dart';
import 'package:toplife/main_systems/system_school/domain/dao/school_relationship_dao.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';
import 'package:toplife/main_systems/system_school/domain/model/school_relationship.dart';

class SchoolRelationshipDaoImpl implements SchoolRelationshipDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const schoolRelationshipTable = "school_relationship";

  static const createTableQuery = '''
    CREATE TABLE $schoolRelationshipTable(
      ${SchoolRelationship.idColumn} $idType,
      ${SchoolRelationship.schoolIDColumn} $integerType,
      ${SchoolRelationship.mainPersonIDColumn} $integerType,
      ${SchoolRelationship.otherPersonIDColumn} $integerType,
      ${SchoolRelationship.schoolRelationshipTypeColumn} $textType,
      ${SchoolRelationship.informalRelationshipTypeColumn} $textType,
      ${SchoolRelationship.gradesColumn} $integerType,
      ${SchoolRelationship.professionalColumn} $boolType,
      ${SchoolRelationship.helpfulColumn} $boolType,
      ${SchoolRelationship.personalityTypeColumn} $textType,
      FOREIGN KEY (${SchoolRelationship.schoolIDColumn})
       REFERENCES ${SchoolDaoImpl.schoolTable} (${School.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE,
      FOREIGN KEY (${SchoolRelationship.mainPersonIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE,
      FOREIGN KEY (${SchoolRelationship.otherPersonIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
  ''';

  @override
  Future<SchoolRelationship> createSchoolRelationship(
      SchoolRelationship schoolRelationship) async {
    final db = await _databaseProvider.database;
    final id = await db.insert(
      schoolRelationshipTable,
      schoolRelationship.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return schoolRelationship.copyWith(id: id);
  }

  @override
  Future<void> deleteSchoolRelationship(int schoolRelationshipID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      schoolRelationshipTable,
      where: "${SchoolRelationship.idColumn} = ?",
      whereArgs: [schoolRelationshipID],
    );
  }

  @override
  Future<List<SchoolRelationship>> getAllClassmates(int schoolID) async {
    final db = await _databaseProvider.database;
    final allClassmatesMap = await db.query(
      schoolRelationshipTable,
      columns: SchoolRelationship.allColumns,
      where:
          "${SchoolRelationship.schoolIDColumn} = ? and ${SchoolRelationship.schoolRelationshipTypeColumn} = ?",
      whereArgs: [
        schoolID,
        SchoolRelationshipType.classmate.name,
      ],
    );

    return allClassmatesMap
        .map((classmateMap) =>
            SchoolRelationship.fromMap(schoolRelationshipMap: classmateMap))
        .toList();
  }

  @override
  Future<List<SchoolRelationship>> getAllProfessors(int schoolID) async {
    final db = await _databaseProvider.database;
    final allProfessorMap = await db.query(
      schoolRelationshipTable,
      columns: SchoolRelationship.allColumns,
      where:
          "${SchoolRelationship.schoolIDColumn} = ? and ${SchoolRelationship.schoolRelationshipTypeColumn} = ?",
      whereArgs: [
        schoolID,
        SchoolRelationshipType.professor.name,
      ],
    );

    return allProfessorMap
        .map((professorMap) =>
            SchoolRelationship.fromMap(schoolRelationshipMap: professorMap))
        .toList();
  }

  @override
  Future<List<SchoolRelationship>> getAllSchoolRelationships(
    int schoolID,
  ) async {
    final db = await _databaseProvider.database;
    final allSchoolRelationshipsMap = await db.query(
      schoolRelationshipTable,
      columns: SchoolRelationship.allColumns,
      where: "${SchoolRelationship.schoolIDColumn} = ?",
      whereArgs: [schoolID],
    );

    return allSchoolRelationshipsMap
        .map((schoolRelationshipMap) => SchoolRelationship.fromMap(
            schoolRelationshipMap: schoolRelationshipMap))
        .toList();
  }

  @override
  Future<SchoolRelationship?> getSchoolRelationship(
    int schoolRelationshipID,
  ) async {
    final db = await _databaseProvider.database;
    final schoolRelationshipMaps = await db.query(
      schoolRelationshipTable,
      columns: SchoolRelationship.allColumns,
      where: "${SchoolRelationship.idColumn} = ?",
      whereArgs: [schoolRelationshipID],
    );

    if (schoolRelationshipMaps.isNotEmpty) {
      return SchoolRelationship.fromMap(
          schoolRelationshipMap: schoolRelationshipMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateSchoolRelationship(
    SchoolRelationship schoolRelationship,
  ) async {
    final db = await _databaseProvider.database;
    await db.update(
      schoolRelationshipTable,
      schoolRelationship.toMap(),
      where: "${SchoolRelationship.idColumn} = ?",
      whereArgs: [schoolRelationship.id],
    );
  }
}
