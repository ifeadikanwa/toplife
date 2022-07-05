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
    await db.insert(
      jobTable,
      job.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    //i dont update with id because the degree table has no copyWith method to avoid updating because it is a record table that the user cannot change.
    return job;
  }

  @override
  Future<void> deleteJobTable() async {
    final db = await _databaseProvider.database;
    await db.delete(jobTable);
  }

  @override
  Future<void> dropAndRecreateJobTable() async {
    final db = await _databaseProvider.database;
    await db.execute("DROP TABLE IF EXISTS $jobTable");
    await db.execute(createTableQuery);
  }

  @override
  Future<void> batchInsertJobs(Set<Job> jobsSet) async {
    final db = await _databaseProvider.database;
    final Batch batch = db.batch();
    for (var job in jobsSet) {
      batch.insert(jobTable, job.toMap());
    }
    batch.commit(noResult: true);
  }

  @override
  Future<List<Job>> getAllJobs() async {
    final db = await _databaseProvider.database;
    final allJobsMap = await db.query(
      jobTable,
      columns: Job.allColumns,
    );

    return allJobsMap.map((jobMap) => Job.fromMap(jobMap: jobMap)).toList();
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
  Future<List<Job>> getFullTimeGeneralJobs() async {
    final db = await _databaseProvider.database;
    final fulltimeGeneralJobMaps = await db.query(
      jobTable,
      columns: Job.allColumns,
      where:
          "${Job.qualifiedDisciplinesColumn} = ? and ${Job.employmentTypeColumn} = ?",
      whereArgs: [
        "[]",
        EmploymentType.fullTime.name,
      ],
    );

    return fulltimeGeneralJobMaps.map((jobMap) => Job.fromMap(jobMap: jobMap)).toList();
  }

  @override
  Future<List<Job>> getPartTimeGeneralJobs() async {
    final db = await _databaseProvider.database;
    final parttimeGeneralJobMaps = await db.query(
      jobTable,
      columns: Job.allColumns,
      where:
          "${Job.qualifiedDisciplinesColumn} = ? and ${Job.employmentTypeColumn} = ?",
      whereArgs: [
        "[]",
        EmploymentType.partTime.name,
      ],
    );

    return parttimeGeneralJobMaps.map((jobMap) => Job.fromMap(jobMap: jobMap)).toList();
  }

  @override
  Future<List<Job>> getJobsForDegreeBranch(String degreeBranch) async {
    final db = await _databaseProvider.database;
    final branchJobMaps = await db.query(
      jobTable,
      columns: Job.allColumns,
      where:
          "${Job.qualifiedBranchesColumn} LIKE ? and ${Job.employmentTypeColumn} = ?",
      whereArgs: [
        //degree branch in any position in the qualified branch string
        "%$degreeBranch%",
        EmploymentType.fullTime.name,
      ],
    );

    return branchJobMaps.map((jobMap) => Job.fromMap(jobMap: jobMap)).toList();
  }

  @override
  Future<List<Job>> getJobsForDegreeDiscipline(String degreeDiscipline) async {
    final db = await _databaseProvider.database;
    final disciplineJobMaps = await db.query(
      jobTable,
      columns: Job.allColumns,
      where:
          "${Job.qualifiedDisciplinesColumn} LIKE ? and ${Job.employmentTypeColumn} = ?",
      whereArgs: [
        //degree branch in any position in the qualified branch string
        "%$degreeDiscipline%",
        EmploymentType.fullTime.name,
      ],
    );

    return disciplineJobMaps.map((jobMap) => Job.fromMap(jobMap: jobMap)).toList();
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
