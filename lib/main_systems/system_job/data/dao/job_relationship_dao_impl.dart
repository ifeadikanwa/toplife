import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_provider.dart' as old_db;
import 'package:toplife/main_systems/system_job/constants/job_relationship_type.dart';
import 'package:toplife/main_systems/system_job/domain/dao/job_relationship_dao.dart';
import 'package:toplife/main_systems/system_job/domain/model/job_relationship.dart';

class JobRelationshipDaoImpl implements JobRelationshipDao {
  final  _databaseProvider = old_db.DatabaseProvider.instance;

  static const jobRelationshipTable = "job_relationship";

  static const createTableQuery = "";
  //  '''
  //   CREATE TABLE $jobRelationshipTable(
  //     ${JobRelationship.idColumn} $idType,
  //     ${JobRelationship.employmentIDColumn} $integerType,
  //     ${JobRelationship.mainPersonIDColumn} $integerType,
  //     ${JobRelationship.otherPersonIDColumn} $integerType,
  //     ${JobRelationship.jobRelationshipTypeColumn} $textType,
  //     ${JobRelationship.informalRelationshipTypeColumn} $textType,
  //     ${JobRelationship.jobLevelColumn} $integerType,
  //     FOREIGN KEY (${JobRelationship.employmentIDColumn})
  //      REFERENCES ${EmploymentDaoImpl.employmentTable} (${Employment.idColumn}) 
  //      ON UPDATE CASCADE
  //      ON DELETE CASCADE,
  //     FOREIGN KEY (${JobRelationship.mainPersonIDColumn})
  //      REFERENCES ${PersonDaoImpl.personTable} () 
  //      ON UPDATE CASCADE
  //      ON DELETE CASCADE,
  //     FOREIGN KEY (${JobRelationship.otherPersonIDColumn})
  //      REFERENCES ${PersonDaoImpl.personTable} ()) 
  //      ON UPDATE CASCADE
  //      ON DELETE CASCADE
  //   )
  // ''';

  @override
  Future<JobRelationship> createJobRelationship(
      JobRelationship jobRelationship) async {
    final db = await _databaseProvider.database;
    final id = await db.insert(
      jobRelationshipTable,
      jobRelationship.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return jobRelationship.copyWith(id: id);
  }

  @override
  Future<void> deleteJobRelationship(int jobRelationshipID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      jobRelationshipTable,
      where: "${JobRelationship.idColumn} = ?",
      whereArgs: [jobRelationshipID],
    );
  }

  @override
  Future<List<JobRelationship>> getAllCoworkers(int employmentID) async {
    final db = await _databaseProvider.database;
    final allCoworkersMap = await db.query(
      jobRelationshipTable,
      columns: JobRelationship.allColumns,
      where:
          "${JobRelationship.employmentIDColumn} = ? and ${JobRelationship.jobRelationshipTypeColumn} = ?",
      whereArgs: [
        employmentID,
        JobRelationshipType.coworker.name,
      ],
    );

    return allCoworkersMap
        .map((coworkerMap) =>
            JobRelationship.fromMap(jobRelationshipMap: coworkerMap))
        .toList();
  }

  @override
  Future<JobRelationship?> getSupervisor(int employmentID) async {
    final db = await _databaseProvider.database;
    final allSupervisorsMap = await db.query(
      jobRelationshipTable,
      columns: JobRelationship.allColumns,
      where:
          "${JobRelationship.employmentIDColumn} = ? and ${JobRelationship.jobRelationshipTypeColumn} = ?",
      whereArgs: [
        employmentID,
        JobRelationshipType.supervisor.name,
      ],
    );

    if (allSupervisorsMap.isNotEmpty) {
      return JobRelationship.fromMap(
          jobRelationshipMap: allSupervisorsMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<List<JobRelationship>> getAllJobRelationships(
    int employmentID,
  ) async {
    final db = await _databaseProvider.database;
    final allJobRelationshipsMap = await db.query(
      jobRelationshipTable,
      columns: JobRelationship.allColumns,
      where: "${JobRelationship.employmentIDColumn} = ?",
      whereArgs: [employmentID],
    );

    return allJobRelationshipsMap
        .map((jobRelationshipMap) =>
            JobRelationship.fromMap(jobRelationshipMap: jobRelationshipMap))
        .toList();
  }

  @override
  Future<JobRelationship?> getJobRelationship(
    int jobRelationshipID,
  ) async {
    final db = await _databaseProvider.database;
    final jobRelationshipMaps = await db.query(
      jobRelationshipTable,
      columns: JobRelationship.allColumns,
      where: "${JobRelationship.idColumn} = ?",
      whereArgs: [jobRelationshipID],
    );

    if (jobRelationshipMaps.isNotEmpty) {
      return JobRelationship.fromMap(
          jobRelationshipMap: jobRelationshipMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateJobRelationship(
    JobRelationship jobRelationship,
  ) async {
    final db = await _databaseProvider.database;
    await db.update(
      jobRelationshipTable,
      jobRelationship.toMap(),
      where: "${JobRelationship.idColumn} = ?",
      whereArgs: [jobRelationship.id],
    );
  }
}
