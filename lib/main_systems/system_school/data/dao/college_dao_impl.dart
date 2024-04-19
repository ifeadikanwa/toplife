import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/main_systems/system_school/constants/college_status.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/dao/college_dao.dart';
import 'package:toplife/main_systems/system_school/domain/model/college.dart';

part 'college_dao_impl.g.dart';

@DriftAccessor(tables: [CollegeTable])
class CollegeDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$CollegeDaoImplMixin
    implements CollegeDao {
  CollegeDaoImpl(super.database);

  @override
  Future<College> createCollege(College college) async {
    final College checkedCollege = college.copyWith(
      project: crossCheckStat(
        stat: college.project,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      courseKnowledge: crossCheckStat(
        stat: college.courseKnowledge,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      cumulativeGrade: crossCheckStat(
        stat: college.cumulativeGrade,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      scholarshipPercentage: crossCheckStat(
        stat: college.scholarshipPercentage,
        statsRange: StatsRangeConstants.defaultRange,
      ),
    );

    final CollegeTableCompanion collegeWithoutID =
        checkedCollege.toCompanion(false).copyWith(id: const Value.absent());

    final collegeID =
        await into(collegeTable).insertOnConflictUpdate(collegeWithoutID);

    return checkedCollege.copyWith(id: collegeID);
  }

  @override
  Future<void> deleteCollege(int collegeID) {
    return (delete(collegeTable)
          ..where(
            (college) => college.id.equals(collegeID),
          ))
        .go();
  }

  @override
  Future<College?> getActiveCollege(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.status.equals(CollegeStatus.active.name),
          )
          ..orderBy(
            [
              (college) => OrderingTerm(
                    expression: college.id,
                    mode: OrderingMode.desc,
                  )
            ],
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<List<College>> getAllActiveColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.status.equals(CollegeStatus.active.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) => college.personId.equals(personID),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllCompletedColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.status.equals(CollegeStatus.completed.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllCompletedCollegesForADegree({
    required int personID,
    required int degreeID,
  }) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.degreeId.equals(degreeID) &
                college.status.equals(CollegeStatus.completed.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllCompletedCollegesForADegreeAtADegreeLevel({
    required int personID,
    required int degreeID,
    required SchoolType schoolType,
  }) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.degreeId.equals(degreeID) &
                college.schoolType.equals(schoolType.name) &
                college.status.equals(CollegeStatus.completed.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllCompletedDoctorateColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType.equals(SchoolType.doctorateSchool.name) &
                college.status.equals(CollegeStatus.completed.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllCompletedGraduateColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType.equals(SchoolType.graduateSchool.name) &
                college.status.equals(CollegeStatus.completed.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllCompletedLawColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType.equals(SchoolType.lawSchool.name) &
                college.status.equals(CollegeStatus.completed.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllCompletedMedicalColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType.equals(SchoolType.medicalSchool.name) &
                college.status.equals(CollegeStatus.completed.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllCompletedNursingColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType.equals(SchoolType.nursingSchool.name) &
                college.status.equals(CollegeStatus.completed.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllCompletedPharmacyColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType.equals(SchoolType.pharmacySchool.name) &
                college.status.equals(CollegeStatus.completed.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllCompletedTeacherColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType
                    .equals(SchoolType.teacherEducationProgram.name) &
                college.status.equals(CollegeStatus.completed.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllCompletedUndergraduateColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType.equals(SchoolType.undergraduateSchool.name) &
                college.status.equals(CollegeStatus.completed.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllDoctorateColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType.equals(SchoolType.doctorateSchool.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllGraduateColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType.equals(SchoolType.graduateSchool.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllLawColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType.equals(SchoolType.lawSchool.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllMedicalColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType.equals(SchoolType.medicalSchool.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllNursingColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType.equals(SchoolType.nursingSchool.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllPharmacyColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType.equals(SchoolType.pharmacySchool.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllTeacherColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType
                    .equals(SchoolType.teacherEducationProgram.name),
          ))
        .get();
  }

  @override
  Future<List<College>> getAllUndergraduateColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.schoolType.equals(SchoolType.undergraduateSchool.name),
          ))
        .get();
  }

  @override
  Future<College?> getCollege(int collegeID) {
    return (select(collegeTable)
          ..where((college) => college.id.equals(collegeID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateCollege(College college) {
    final College checkedCollege = college.copyWith(
      project: crossCheckStat(
        stat: college.project,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      courseKnowledge: crossCheckStat(
        stat: college.courseKnowledge,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      cumulativeGrade: crossCheckStat(
        stat: college.cumulativeGrade,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      scholarshipPercentage: crossCheckStat(
        stat: college.scholarshipPercentage,
        statsRange: StatsRangeConstants.defaultRange,
      ),
    );

    return update(collegeTable).replace(checkedCollege);
  }

  @override
  Stream<College?> watchActiveCollege(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.status.equals(CollegeStatus.active.name),
          )
          ..orderBy(
            [
              (college) => OrderingTerm(
                    expression: college.id,
                    mode: OrderingMode.desc,
                  )
            ],
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<List<College>> watchAllColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) => college.personId.equals(personID),
          ))
        .watch();
  }

  @override
  Stream<List<College>> watchAllCompletedColleges(int personID) {
    return (select(collegeTable)
          ..where(
            (college) =>
                college.personId.equals(personID) &
                college.status.equals(CollegeStatus.completed.name),
          ))
        .watch();
  }

  @override
  Stream<College?> watchCollege(int collegeID) {
    return (select(collegeTable)
          ..where((college) => college.id.equals(collegeID))
          ..limit(1))
        .watchSingleOrNull();
  }
}
