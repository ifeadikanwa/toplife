import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/constants/degree_level.dart';
import 'package:toplife/main_systems/system_school/domain/dao/school_dao.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';

part 'school_dao_impl.g.dart';

@DriftAccessor(tables: [SchoolTable])
class SchoolDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$SchoolDaoImplMixin
    implements SchoolDao {
  SchoolDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<School> createSchool(School school) async {
    final SchoolTableCompanion schoolWithoutID =
        school.toCompanion(false).copyWith(id: const Value.absent());

    final schoolID =
        await into(schoolTable).insertOnConflictUpdate(schoolWithoutID);
    return school.copyWith(id: schoolID);
  }

  @override
  Future<void> deleteSchool(int schoolID) {
    return (delete(schoolTable)
          ..where(
            (school) => school.id.equals(schoolID),
          ))
        .go();
  }

  @override
  Future<School?> getActiveSchool(int mainPersonID) {
    return (select(schoolTable)
          ..where(
            (school) =>
                school.mainPersonId.equals(mainPersonID) &
                school.isActive.equals(true),
          )
          ..orderBy(
            [
              (school) => OrderingTerm(
                    expression: school.id,
                    mode: OrderingMode.desc,
                  )
            ],
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<List<School>> getAllActiveSchools(int mainPersonID) {
    return (select(schoolTable)
          ..where(
            (school) =>
                school.mainPersonId.equals(mainPersonID) &
                school.isActive.equals(true),
          )
          ..orderBy(
            [
              (school) => OrderingTerm(
                    expression: school.id,
                    mode: OrderingMode.desc,
                  )
            ],
          ))
        .get();
  }

  @override
  Future<List<School>> getAllCompletedDoctorateSchool(int mainPersonID) {
    return (select(schoolTable)
          ..where(
            (school) =>
                school.mainPersonId.equals(mainPersonID) &
                school.isCompleted.equals(true) &
                school.isActive.equals(false) &
                school.degreeLevel.equals(DegreeLevel.doctorate.name),
          )
          ..orderBy(
            [
              (school) => OrderingTerm(
                    expression: school.id,
                    mode: OrderingMode.desc,
                  )
            ],
          ))
        .get();
  }

  @override
  Future<List<School>> getAllCompletedGraduateSchool(int mainPersonID) {
    return (select(schoolTable)
          ..where(
            (school) =>
                school.mainPersonId.equals(mainPersonID) &
                school.isCompleted.equals(true) &
                school.isActive.equals(false) &
                school.degreeLevel.equals(DegreeLevel.master.name),
          )
          ..orderBy(
            [
              (school) => OrderingTerm(
                    expression: school.id,
                    mode: OrderingMode.desc,
                  )
            ],
          ))
        .get();
  }

  @override
  Future<List<School>> getAllCompletedSchool(int mainPersonID) {
    return (select(schoolTable)
          ..where(
            (school) =>
                school.mainPersonId.equals(mainPersonID) &
                school.isCompleted.equals(true) &
                school.isActive.equals(false),
          )
          ..orderBy(
            [
              (school) => OrderingTerm(
                    expression: school.id,
                    mode: OrderingMode.desc,
                  )
            ],
          ))
        .get();
  }

  @override
  Future<List<School>> getAllCompletedSchoolForADegree(
      int mainPersonID, int degreeID) {
    return (select(schoolTable)
          ..where(
            (school) =>
                school.mainPersonId.equals(mainPersonID) &
                school.isCompleted.equals(true) &
                school.isActive.equals(false) &
                school.degreeId.equals(degreeID),
          )
          ..orderBy(
            [
              (school) => OrderingTerm(
                    expression: school.id,
                    mode: OrderingMode.desc,
                  )
            ],
          ))
        .get();
  }

  @override
  Future<List<School>> getAllCompletedSpecialSchool(int mainPersonID) {
    return (select(schoolTable)
          ..where(
            (school) =>
                school.mainPersonId.equals(mainPersonID) &
                school.isCompleted.equals(true) &
                school.isActive.equals(false) &
                school.degreeLevel.equals(DegreeLevel.special.name),
          )
          ..orderBy(
            [
              (school) => OrderingTerm(
                    expression: school.id,
                    mode: OrderingMode.desc,
                  )
            ],
          ))
        .get();
  }

  @override
  Future<List<School>> getAllCompletedUndergraduateSchool(int mainPersonID) {
    return (select(schoolTable)
          ..where(
            (school) =>
                school.mainPersonId.equals(mainPersonID) &
                school.isCompleted.equals(true) &
                school.isActive.equals(false) &
                school.degreeLevel.equals(DegreeLevel.bachelor.name),
          )
          ..orderBy(
            [
              (school) => OrderingTerm(
                    expression: school.id,
                    mode: OrderingMode.desc,
                  )
            ],
          ))
        .get();
  }

  @override
  Future<List<School>> getAllSchools(int mainPersonID) {
    return (select(schoolTable)
          ..where(
            (school) => school.mainPersonId.equals(mainPersonID),
          )
          ..orderBy(
            [
              (school) => OrderingTerm(
                    expression: school.id,
                    mode: OrderingMode.desc,
                  )
            ],
          ))
        .get();
  }

  @override
  Future<School?> getCompletedSchoolForADegreeAtADegreeLevel(
      int mainPersonID, int degreeID, DegreeLevel degreeLevel) {
    return (select(schoolTable)
          ..where(
            (school) =>
                school.mainPersonId.equals(mainPersonID) &
                school.isCompleted.equals(true) &
                school.isActive.equals(false) &
                school.degreeId.equals(degreeID) &
                school.degreeLevel.equals(degreeLevel.name),
          )
          ..orderBy(
            [
              (school) => OrderingTerm(
                    expression: school.id,
                    mode: OrderingMode.desc,
                  )
            ],
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<School?> getSchool(int schoolID) {
    return (select(schoolTable)
          ..where((school) => school.id.equals(schoolID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateSchool(School school) {
    return update(schoolTable).replace(school);
  }

  @override
  Stream<School?> watchSchool(int schoolID) {
    return (select(schoolTable)
          ..where((school) => school.id.equals(schoolID))
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<School?> watchActiveSchool(int mainPersonID) {
    return (select(schoolTable)
          ..where(
            (school) =>
                school.mainPersonId.equals(mainPersonID) &
                school.isActive.equals(true),
          )
          ..orderBy(
            [
              (school) => OrderingTerm(
                    expression: school.id,
                    mode: OrderingMode.desc,
                  )
            ],
          )
          ..limit(1))
        .watchSingleOrNull();
  }
}
