import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/dao/school_project_dao.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/model/school_project.dart';

part 'school_project_dao_impl.g.dart';

@DriftAccessor(tables: [SchoolProjectTable])
class SchoolProjectDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$SchoolProjectDaoImplMixin
    implements SchoolProjectDao {
  SchoolProjectDaoImpl(super.database);

  @override
  Future<SchoolProject> createSchoolProject(SchoolProject schoolProject) async {
    final SchoolProject checkedSchoolProject = schoolProject.copyWith(
      mainPersonContribution: crossCheckStat(
        stat: schoolProject.mainPersonContribution,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      projectPartnerContribution: crossCheckStat(
        stat: schoolProject.projectPartnerContribution,
        statsRange: StatsRangeConstants.defaultRange,
      ),
    );

    final SchoolProjectTableCompanion schoolProjectWithoutID =
        checkedSchoolProject
            .toCompanion(false)
            .copyWith(id: const Value.absent());

    final schoolProjectID = await into(schoolProjectTable)
        .insertOnConflictUpdate(schoolProjectWithoutID);

    return checkedSchoolProject.copyWith(id: schoolProjectID);
  }

  @override
  Future<void> deleteSchoolProject(int schoolProjectID) {
    return (delete(schoolProjectTable)
          ..where(
            (schoolProject) => schoolProject.id.equals(schoolProjectID),
          ))
        .go();
  }

  @override
  Future<SchoolProject?> getActiveSchoolProject(
    int mainPersonID,
    int schoolID,
    int semesterNumber,
  ) {
    return (select(schoolProjectTable)
          ..where(
            (schoolProject) =>
                schoolProject.mainPersonId.equals(mainPersonID) &
                schoolProject.schoolId.equals(schoolID) &
                schoolProject.semesterNumber.equals(semesterNumber),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<List<SchoolProject>> getAllSchoolProjects(int mainPersonID) {
    return (select(schoolProjectTable)
          ..where(
            (schoolProject) => schoolProject.mainPersonId.equals(mainPersonID),
          ))
        .get();
  }

  @override
  Future<SchoolProject?> getSchoolProject(int schoolProjectID) {
    return (select(schoolProjectTable)
          ..where((schoolProject) => schoolProject.id.equals(schoolProjectID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateSchoolProject(SchoolProject schoolProject) {
    final SchoolProject checkedSchoolProject = schoolProject.copyWith(
      mainPersonContribution: crossCheckStat(
        stat: schoolProject.mainPersonContribution,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      projectPartnerContribution: crossCheckStat(
        stat: schoolProject.projectPartnerContribution,
        statsRange: StatsRangeConstants.defaultRange,
      ),
    );

    return update(schoolProjectTable).replace(checkedSchoolProject);
  }

  @override
  Stream<SchoolProject?> watchActiveSchoolProject(
      int mainPersonID, int schoolID, int semesterNumber) {
    return (select(schoolProjectTable)
          ..where(
            (schoolProject) =>
                schoolProject.mainPersonId.equals(mainPersonID) &
                schoolProject.schoolId.equals(schoolID) &
                schoolProject.semesterNumber.equals(semesterNumber),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<SchoolProject?> watchSchoolProject(int schoolProjectID) {
    return (select(schoolProjectTable)
          ..where(
            (schoolProject) => schoolProject.id.equals(schoolProjectID),
          )
          ..limit(1))
        .watchSingleOrNull();
  }
}
