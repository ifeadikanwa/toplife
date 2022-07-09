import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_job/domain/dao/job_dao.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';

class JobDaoImpl implements JobDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const jobTable = "job";

  static const createTableQuery = '''
    CREATE TABLE $jobTable(
      ${Job.idColumn} $idType,
      ${Job.jobTitleColumn} $textType,
      ${Job.jobTypeColumn} $textType,
      ${Job.companySuffixColumn} $textType,
      ${Job.employmentTypeColumn} $textType, 
      ${Job.getsTipsColumn} $boolType,
      ${Job.levelOneTitleColumn} $textType,
      ${Job.levelOneBasePayColumn} $integerType,
      ${Job.levelTwoTitleColumn} $textType,
      ${Job.levelTwoBasePayColumn} $integerType,
      ${Job.levelThreeTitleColumn} $textType,
      ${Job.levelThreeBasePayColumn} $integerType,
      ${Job.qualifiedDisciplinesColumn} $textType,
      ${Job.qualifiedBranchesColumn} $textType,
      ${Job.healthInsuranceCoverageColumn} $integerType
    )
''';

  @override
  Future<Job> createJob(Job job) async {
    final db = await _databaseProvider.database;
    await db.insert(
      jobTable,
      job.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    //i dont update with id because the degree table has no copyWith method to avoid updating because it is a record table that the user cannot change.
    return job;
  }

  @override
  Future<Job?> getJob(int jobID) async {
    final db = await _databaseProvider.database;
    final jobMaps = await db.query(
      jobTable,
      columns: Job.allColumns,
      where: "${Job.idColumn} = ?",
      whereArgs: [jobID],
    );

    if (jobMaps.isNotEmpty) {
      return Job.fromMap(jobMap: jobMaps.first);
    } else {
      return null;
    }
  }

    @override
  Future<Job?> findJobWithJobTitle(String jobTitle) async {
    final db = await _databaseProvider.database;
    final jobMaps = await db.query(
      jobTable,
      columns: Job.allColumns,
      where: "${Job.jobTitleColumn} = ?",
      whereArgs: [jobTitle],
    );

    if (jobMaps.isNotEmpty) {
      return Job.fromMap(jobMap: jobMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateJob(Job job) async {
    final db = await _databaseProvider.database;
    await db.update(
      jobTable,
      job.toMap(),
      where: "${Job.idColumn} = ?",
      whereArgs: [job.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
