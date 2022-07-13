import 'package:toplife/main_systems/system_school/domain/model/degree.dart';

abstract class DegreeRepository {
  Future<Degree> createDegree(Degree degree);
  Future<void> updateDegree(Degree degree);
  Future<Degree?> getDegree(int degreeID);
  Future<Degree?> findDegreeWithDegreeDisciplineAndBranch(
    String degreeDiscipline,
    String degreeBranch,
  );
}
