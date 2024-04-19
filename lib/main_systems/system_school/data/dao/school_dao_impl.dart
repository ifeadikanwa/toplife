import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/domain/dao/school_dao.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';

part 'school_dao_impl.g.dart';

@DriftAccessor(tables: [SchoolTable])
class SchoolDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$SchoolDaoImplMixin
    implements SchoolDao {
  SchoolDaoImpl(super.database);

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
  Future<School?> findSchoolWithNameAndLocation({
    required String name,
    required String state,
    required String country,
  }) {
    return (select(schoolTable)
          ..where(
            (school) =>
                school.name.equals(name) &
                school.state.equals(state) &
                school.country.equals(country),
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
}
