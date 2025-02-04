import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class DegreeDao {
  Future<Degree> createDegree(Degree degree);
  Future<void> updateDegree(Degree degree);
  Future<Degree?> getDegree(int degreeID);
  Future<Degree?> findDegreeWithDegreeDisciplineAndBranch({
    required String degreeDiscipline,
    required String degreeBranch,
  });
}
