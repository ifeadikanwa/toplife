import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/dao/employment_dao.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/model/employment.dart';

part 'employment_dao_impl.g.dart';

@DriftAccessor(tables: [EmploymentTable])
class EmploymentDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$EmploymentDaoImplMixin
    implements EmploymentDao {
  EmploymentDaoImpl(super.database);

  @override
  Future<Employment> createEmployment(Employment employment) async {
    final Employment checkedEmployment = employment.copyWith(
      jobPerformance: crossCheckStat(
        stat: employment.jobPerformance,
        statsRange: StatsRangeConstants.defaultRange,
      ),
    );

    final EmploymentTableCompanion employmentWithoutID =
        checkedEmployment.toCompanion(false).copyWith(id: const Value.absent());

    final employmentID =
        await into(employmentTable).insertOnConflictUpdate(employmentWithoutID);

    return checkedEmployment.copyWith(id: employmentID);
  }

  @override
  Future<void> deleteEmployment(int employmentID) {
    return (delete(employmentTable)
          ..where(
            (employment) => employment.id.equals(employmentID),
          ))
        .go();
  }

  @override
  Future<List<Employment>> getAllActiveEmployments(int mainPersonID) {
    return (select(employmentTable)
          ..where(
            (employment) =>
                employment.mainPersonId.equals(mainPersonID) &
                employment.isActive.equals(true),
          )
          ..orderBy(
            [
              (employment) => OrderingTerm(
                    expression: employment.id,
                    mode: OrderingMode.desc,
                  )
            ],
          ))
        .get();
  }

  @override
  Future<List<Employment>> getAllEmployments(int mainPersonID) {
    return (select(employmentTable)
          ..where(
            (employment) => employment.mainPersonId.equals(mainPersonID),
          )
          ..orderBy(
            [
              (employment) => OrderingTerm(
                    expression: employment.id,
                    mode: OrderingMode.desc,
                  )
            ],
          ))
        .get();
  }

  @override
  Future<List<Employment>> getAllEmploymentsForAJob(
      int mainPersonID, int jobID) {
    return (select(employmentTable)
          ..where(
            (employment) =>
                employment.mainPersonId.equals(mainPersonID) &
                employment.jobId.equals(jobID),
          )
          ..orderBy(
            [
              (employment) => OrderingTerm(
                    expression: employment.id,
                    mode: OrderingMode.desc,
                  )
            ],
          ))
        .get();
  }

  @override
  Future<Employment?> getEmployment(int employmentID) {
    return (select(employmentTable)
          ..where((employment) => employment.id.equals(employmentID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateEmployment(Employment employment) {
    final Employment checkedEmployment = employment.copyWith(
      jobPerformance: crossCheckStat(
        stat: employment.jobPerformance,
        statsRange: StatsRangeConstants.defaultRange,
      ),
    );

    return update(employmentTable).replace(checkedEmployment);
  }

  @override
  Stream<List<Employment>> watchAllActiveEmployments(int mainPersonID) {
    return (select(employmentTable)
          ..where(
            (employment) =>
                employment.mainPersonId.equals(mainPersonID) &
                employment.isActive.equals(true),
          )
          ..orderBy(
            [
              (employment) => OrderingTerm(
                    expression: employment.id,
                    mode: OrderingMode.desc,
                  )
            ],
          ))
        .watch();
  }

  @override
  Stream<Employment?> watchEmployment(int employmentID) {
    return (select(employmentTable)
          ..where((employment) => employment.id.equals(employmentID))
          ..limit(1))
        .watchSingleOrNull();
  }
}
