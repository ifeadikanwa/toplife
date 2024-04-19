import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/dao/precollege_dao.dart';
import 'package:toplife/main_systems/system_school/domain/model/precollege.dart';

part 'precollege_dao_impl.g.dart';

@DriftAccessor(tables: [PrecollegeTable])
class PrecollegeDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$PrecollegeDaoImplMixin
    implements PrecollegeDao {
  PrecollegeDaoImpl(super.database);

  @override
  Future<Precollege> createPrecollege(Precollege precollege) async {
    final Precollege checkedPrecollege = precollege.copyWith(
      courseKnowledge: crossCheckStat(
        stat: precollege.courseKnowledge,
        statsRange: StatsRangeConstants.defaultRange,
      ),
    );

    await into(precollegeTable).insertOnConflictUpdate(checkedPrecollege);
    return precollege;
  }

  @override
  Future<void> deletePrecollege(int personID, SchoolType schoolType) {
    return (delete(precollegeTable)
          ..where(
            (precollege) =>
                precollege.personId.equals(personID) &
                precollege.schoolType.equals(schoolType.name),
          ))
        .go();
  }

  @override
  Future<List<Precollege>> getAllPrecolleges(int personID) {
    return (select(precollegeTable)
          ..where(
            (precollege) => precollege.personId.equals(personID),
          ))
        .get();
  }

  @override
  Future<Precollege?> getElementarySchool(int personID) {
    return (select(precollegeTable)
          ..where(
            (precollege) =>
                precollege.personId.equals(personID) &
                precollege.schoolType.equals(SchoolType.elementarySchool.name),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<Precollege?> getHighSchool(int personID) {
    return (select(precollegeTable)
          ..where(
            (precollege) =>
                precollege.personId.equals(personID) &
                precollege.schoolType.equals(SchoolType.highSchool.name),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<Precollege?> getMiddleSchool(int personID) {
    return (select(precollegeTable)
          ..where(
            (precollege) =>
                precollege.personId.equals(personID) &
                precollege.schoolType.equals(SchoolType.middleSchool.name),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<Precollege?> getPrecollege(int personID, SchoolType schoolType) {
    return (select(precollegeTable)
          ..where(
            (precollege) =>
                precollege.personId.equals(personID) &
                precollege.schoolType.equals(schoolType.name),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updatePrecollege(Precollege precollege) {
    final Precollege checkedPrecollege = precollege.copyWith(
      courseKnowledge: crossCheckStat(
        stat: precollege.courseKnowledge,
        statsRange: StatsRangeConstants.defaultRange,
      ),
    );

    return update(precollegeTable).replace(checkedPrecollege);
  }

  @override
  Stream<List<Precollege>> watchAllPrecolleges(int personID) {
    return (select(precollegeTable)
          ..where(
            (precollege) => precollege.personId.equals(personID),
          ))
        .watch();
  }

  @override
  Stream<Precollege?> watchElementarySchool(int personID) {
    return (select(precollegeTable)
          ..where(
            (precollege) =>
                precollege.personId.equals(personID) &
                precollege.schoolType.equals(SchoolType.elementarySchool.name),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<Precollege?> watchHighSchool(int personID) {
    return (select(precollegeTable)
          ..where(
            (precollege) =>
                precollege.personId.equals(personID) &
                precollege.schoolType.equals(SchoolType.highSchool.name),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<Precollege?> watchMiddleSchool(int personID) {
    return (select(precollegeTable)
          ..where(
            (precollege) =>
                precollege.personId.equals(personID) &
                precollege.schoolType.equals(SchoolType.middleSchool.name),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<Precollege?> watchPrecollege(int personID, SchoolType schoolType) {
    return (select(precollegeTable)
          ..where(
            (precollege) =>
                precollege.personId.equals(personID) &
                precollege.schoolType.equals(schoolType.name),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Future<List<Precollege>> getAllStudentsOfASchool(int schoolID) {
    return (select(precollegeTable)
          ..where((precollege) => precollege.currentSchoolId.equals(schoolID)))
        .get();
  }

  @override
  Stream<List<Precollege>> watchAllStudentsOfASchool(int schoolID) {
    return (select(precollegeTable)
          ..where((precollege) => precollege.currentSchoolId.equals(schoolID)))
        .watch();
  }

  @override
  Future<List<Precollege>> getAllActiveStudentsOfASchool(int schoolID) {
    return (select(precollegeTable)
          ..where(
            (precollege) =>
                precollege.currentSchoolId.equals(schoolID) &
                precollege.active.equals(true),
          ))
        .get();
  }

  @override
  Stream<List<Precollege>> watchAllActiveStudentsOfASchool(int schoolID) {
    return (select(precollegeTable)
          ..where(
            (precollege) =>
                precollege.currentSchoolId.equals(schoolID) &
                precollege.active.equals(true),
          ))
        .watch();
  }
}
