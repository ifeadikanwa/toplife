import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_job/domain/dao/job_dao.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';

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
    final int id = await db.insert(
      jobTable,
      job.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return job.copyWith(id: id);
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
  Future<Job?> findFullTimeJobWithJobTitle(String jobTitle) async {
    final db = await _databaseProvider.database;
    final jobMaps = await db.query(
      jobTable,
      columns: Job.allColumns,
      where: "${Job.jobTitleColumn} = ? and ${Job.employmentTypeColumn} = ?",
      whereArgs: [
        jobTitle,
        EmploymentType.fullTime.name,
      ],
    );

    if (jobMaps.isNotEmpty) {
      return Job.fromMap(jobMap: jobMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<Job?> findPartTimeJobWithJobTitle(String jobTitle) async {
    final db = await _databaseProvider.database;
    final jobMaps = await db.query(
      jobTable,
      columns: Job.allColumns,
      where: "${Job.jobTitleColumn} = ? and ${Job.employmentTypeColumn} = ?",
      whereArgs: [
        jobTitle,
        EmploymentType.partTime.name,
      ],
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
