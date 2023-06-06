import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_job/domain/dao/job_dao.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';

part 'job_dao_impl.g.dart';

@DriftAccessor(tables: [JobTable])
class JobDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$JobDaoImplMixin
    implements JobDao {
  JobDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Job> createJob(Job job) async {
    final Job checkedJob = job.copyWith(
      healthInsuranceCoverage: crossCheckStat(job.healthInsuranceCoverage),
    );

    final JobTableCompanion jobWithoutID =
        checkedJob.toCompanion(false).copyWith(
              id: const Value.absent(),
            );

    final jobID = await into(jobTable).insertOnConflictUpdate(jobWithoutID);
    return checkedJob.copyWith(id: jobID);
  }

  @override
  Future<Job?> findFullTimeJobWithJobTitle(String jobTitle) {
    return (select(jobTable)
          ..where(
            (job) =>
                job.jobTitle.equals(jobTitle) &
                job.employmentType.equals(EmploymentType.fullTime.name),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<Job?> findPartTimeJobWithJobTitle(String jobTitle) {
    return (select(jobTable)
          ..where(
            (job) =>
                job.jobTitle.equals(jobTitle) &
                job.employmentType.equals(EmploymentType.partTime.name),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<Job?> getJob(int jobID) {
    return (select(jobTable)
          ..where((job) => job.id.equals(jobID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateJob(Job job) {
    final Job checkedJob = job.copyWith(
      healthInsuranceCoverage: crossCheckStat(job.healthInsuranceCoverage),
    );

    return update(jobTable).replace(checkedJob);
  }
}
