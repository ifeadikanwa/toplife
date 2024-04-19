import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/domain/dao/degree_dao.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';

part 'degree_dao_impl.g.dart';

@DriftAccessor(tables: [DegreeTable])
class DegreeDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$DegreeDaoImplMixin
    implements DegreeDao {
  DegreeDaoImpl(super.database);

  @override
  Future<Degree> createDegree(Degree degree) async {
    final DegreeTableCompanion degreeWithoutID =
        degree.toCompanion(false).copyWith(id: const Value.absent());

    final degreeID =
        await into(degreeTable).insertOnConflictUpdate(degreeWithoutID);
    return degree.copyWith(id: degreeID);
  }

  @override
  Future<Degree?> findDegreeWithDegreeDisciplineAndBranch(
      {required String degreeDiscipline, required String degreeBranch}) {
    return (select(degreeTable)
          ..where(
            (degree) =>
                degree.discipline.equals(degreeDiscipline) &
                degree.branch.equals(degreeBranch),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<Degree?> getDegree(int degreeID) {
    return (select(degreeTable)
          ..where((degree) => degree.id.equals(degreeID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateDegree(Degree degree) {
    return update(degreeTable).replace(degree);
  }
}
