import 'package:toplife/main_systems/system_school/domain/model/degree.dart';

abstract class DegreeRepository {
  Future<Degree> createDegree(Degree degree);
  Future<void> updateDegree(Degree degree);
  Future<List<Degree>> getAllDegrees();
  Future<Degree?> getDegree(int degreeID);
  Future<void> deleteDegreeTable();
  Future<void> dropAndRecreateDegreeTable();
  Future<void> batchInsertDegrees(Set<Degree> degreesSet);
}
