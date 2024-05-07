import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/dao/faculty_dao.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/model/faculty.dart';

part 'faculty_dao_impl.g.dart';

@DriftAccessor(tables: [FacultyTable])
class FacultyDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$FacultyDaoImplMixin
    implements FacultyDao {
  FacultyDaoImpl(super.database);

  @override
  Future<Faculty> createOrUpdateFaculty(Faculty faculty) async {
    //I use insert with a replace mode because insertOnConflictUpdate
    //does not recognize unique constraints that aren't primary keys.
    //This table has no primary key, only a UNIQUE column
    await into(facultyTable).insert(faculty, mode: InsertMode.insertOrReplace);
    return faculty;
  }

  @override
  Future<List<Faculty>> getAllFacultyForSchool(int schoolID) {
    return (select(facultyTable)
          ..where((faculty) => faculty.schoolId.equals(schoolID)))
        .get();
  }

  @override
  Future<Faculty?> getFaculty(int personID) {
    return (select(facultyTable)
          ..where((faculty) => faculty.personId.equals(personID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Stream<Faculty?> watchFaculty(int personID) {
    return (select(facultyTable)
          ..where((faculty) => faculty.personId.equals(personID))
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Future<void> deleteFaculty(int personID) {
    return (delete(facultyTable)
          ..where(
            (faculty) => faculty.personId.equals(personID),
          ))
        .go();
  }

  @override
  Stream<List<Faculty>> watchAllFacultyForSchool(int schoolID) {
    return (select(facultyTable)
          ..where((faculty) => faculty.schoolId.equals(schoolID)))
        .watch();
  }
}
