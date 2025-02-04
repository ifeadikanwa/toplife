import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_job/constants/job_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/dao/job_relationship_dao.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/model/job_relationship.dart';

part 'job_relationship_dao_impl.g.dart';

@DriftAccessor(tables: [JobRelationshipTable])
class JobRelationshipDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$JobRelationshipDaoImplMixin
    implements JobRelationshipDao {
  JobRelationshipDaoImpl(super.database);

  @override
  Future<JobRelationship> createJobRelationship(
      JobRelationship jobRelationship) async {
    final JobRelationshipTableCompanion jobRelationshipWithoutID =
        jobRelationship.toCompanion(false).copyWith(id: const Value.absent());

    final jobRelationshipID = await into(jobRelationshipTable)
        .insertOnConflictUpdate(jobRelationshipWithoutID);
    return jobRelationship.copyWith(id: jobRelationshipID);
  }

  @override
  Future<void> deleteJobRelationship(int jobRelationshipID) {
    return (delete(jobRelationshipTable)
          ..where((jobRelationship) =>
              jobRelationship.id.equals(jobRelationshipID)))
        .go();
  }

  @override
  Future<List<JobRelationship>> getAllCoworkers(int employmentID) {
    return (select(jobRelationshipTable)
          ..where(
            (jobRelationship) =>
                jobRelationship.employmentId.equals(employmentID) &
                jobRelationship.jobRelationshipType
                    .equals(JobRelationshipType.coworker.name),
          ))
        .get();
  }

  @override
  Future<List<JobRelationship>> getAllJobRelationships(int employmentID) {
    return (select(jobRelationshipTable)
          ..where(
            (jobRelationship) =>
                jobRelationship.employmentId.equals(employmentID),
          ))
        .get();
  }

  @override
  Future<JobRelationship?> getJobRelationship(int jobRelationshipID) {
    return (select(jobRelationshipTable)
          ..where(
              (jobRelationship) => jobRelationship.id.equals(jobRelationshipID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<JobRelationship?> getSupervisor(int employmentID) {
    return (select(jobRelationshipTable)
          ..where(
            (jobRelationship) =>
                jobRelationship.employmentId.equals(employmentID) &
                jobRelationship.jobRelationshipType
                    .equals(JobRelationshipType.supervisor.name),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateJobRelationship(JobRelationship jobRelationship) {
    return update(jobRelationshipTable).replace(jobRelationship);
  }

  @override
  Stream<List<JobRelationship>> watchAllJobRelationships(int employmentID) {
    return (select(jobRelationshipTable)
          ..where(
            (jobRelationship) =>
                jobRelationship.employmentId.equals(employmentID),
          ))
        .watch();
  }

  @override
  Stream<JobRelationship?> watchJobRelationship(int jobRelationshipID) {
    return (select(jobRelationshipTable)
          ..where(
              (jobRelationship) => jobRelationship.id.equals(jobRelationshipID))
          ..limit(1))
        .watchSingleOrNull();
  }
}
