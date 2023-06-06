import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_school/constants/school_relationship_type.dart';
import 'package:toplife/main_systems/system_school/domain/dao/school_relationship_dao.dart';
import 'package:toplife/main_systems/system_school/domain/model/school_relationship.dart';

part 'school_relationship_dao_impl.g.dart';

@DriftAccessor(tables: [SchoolRelationshipTable])
class SchoolRelationshipDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$SchoolRelationshipDaoImplMixin
    implements SchoolRelationshipDao {
  SchoolRelationshipDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<SchoolRelationship> createSchoolRelationship(
      SchoolRelationship schoolRelationship) async {
    //check grades
    final SchoolRelationship checkedSchoolRelationship =
        schoolRelationship.copyWith(
      grades: crossCheckStat(schoolRelationship.grades),
    );

    final SchoolRelationshipTableCompanion schoolRelationshipWithoutID =
        checkedSchoolRelationship
            .toCompanion(false)
            .copyWith(id: const Value.absent());

    final schoolRelationshipID = await into(schoolRelationshipTable)
        .insertOnConflictUpdate(schoolRelationshipWithoutID);

    return checkedSchoolRelationship.copyWith(id: schoolRelationshipID);
  }

  @override
  Future<void> deleteSchoolRelationship(int schoolRelationshipID) {
    return (delete(schoolRelationshipTable)
          ..where((schoolRelationship) =>
              schoolRelationship.id.equals(schoolRelationshipID)))
        .go();
  }

  @override
  Future<List<SchoolRelationship>> getAllClassmates(int schoolID) {
    return (select(schoolRelationshipTable)
          ..where(
            (schoolRelationship) =>
                schoolRelationship.schoolId.equals(schoolID) &
                schoolRelationship.schoolRelationshipType
                    .equals(SchoolRelationshipType.classmate.name),
          ))
        .get();
  }

  @override
  Future<List<SchoolRelationship>> getAllProfessors(int schoolID) {
    return (select(schoolRelationshipTable)
          ..where(
            (schoolRelationship) =>
                schoolRelationship.schoolId.equals(schoolID) &
                schoolRelationship.schoolRelationshipType
                    .equals(SchoolRelationshipType.professor.name),
          ))
        .get();
  }

  @override
  Future<List<SchoolRelationship>> getAllSchoolRelationships(int schoolID) {
    return (select(schoolRelationshipTable)
          ..where(
            (schoolRelationship) =>
                schoolRelationship.schoolId.equals(schoolID),
          ))
        .get();
  }

  @override
  Future<SchoolRelationship?> getSchoolRelationship(int schoolRelationshipID) {
    return (select(schoolRelationshipTable)
          ..where((schoolRelationship) =>
              schoolRelationship.id.equals(schoolRelationshipID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateSchoolRelationship(SchoolRelationship schoolRelationship) {
    return update(schoolRelationshipTable).replace(
      schoolRelationship.copyWith(
        grades: crossCheckStat(schoolRelationship.grades),
      ),
    );
  }

  @override
  Stream<List<SchoolRelationship>> watchAllClassmates(int schoolID) {
    return (select(schoolRelationshipTable)
          ..where(
            (schoolRelationship) =>
                schoolRelationship.schoolId.equals(schoolID) &
                schoolRelationship.schoolRelationshipType
                    .equals(SchoolRelationshipType.classmate.name),
          ))
        .watch();
  }

  @override
  Stream<List<SchoolRelationship>> watchAllProfessors(int schoolID) {
    return (select(schoolRelationshipTable)
          ..where(
            (schoolRelationship) =>
                schoolRelationship.schoolId.equals(schoolID) &
                schoolRelationship.schoolRelationshipType
                    .equals(SchoolRelationshipType.professor.name),
          ))
        .watch();
  }

  @override
  Stream<SchoolRelationship?> watchSchoolRelationship(
      int schoolRelationshipID) {
    return (select(schoolRelationshipTable)
          ..where((schoolRelationship) =>
              schoolRelationship.id.equals(schoolRelationshipID))
          ..limit(1))
        .watchSingleOrNull();
  }
}
